# RFD: Stateful AI DAG Architecture with Phoenix and Ash Framework

**Status:** Draft  
**Authors:** Stew  
**Created:** 2026-02-03  
**Updated:** 2026-02-03  
**Context:** Evaluating Phoenix + Ash Framework for AI-powered SaaS applications (Indicia, REoP)

---

## 0. Current State

**Foundation Complete:**
- [x] Phoenix 1.8.3 with LiveView 1.1
- [x] Ash 3.0 with AshPostgres 2.0
- [x] AshAuthentication 4.0 with magic link strategy
- [x] AshAdmin 0.13
- [x] AshPhoenix 2.0
- [x] Established domain pattern: `ElixirLizards.Accounts` with `User`/`Token` resources
- [x] Database migrations and Repo configured

**Not Yet Implemented:**
- [ ] AshOban for job orchestration
- [ ] AshAI for prompt-backed actions (or ReqLLM alternative)
- [ ] Pipeline domain with Content/PipelineRun/Result resources
- [ ] LLM integration layer

**Dependencies to Add (mix.exs):**
```elixir
# Required for POC
{:ash_oban, "~> 0.3"},
{:oban, "~> 2.18"},

# LLM integration (choose one)
{:req_llm, "~> 0.1"},       # Recommended: lightweight, builds on existing Req
# OR
{:ash_ai, "~> 0.1"},        # Alternative: deeper Ash integration, larger deps
{:langchain, "~> 0.3"},     # Required if using AshAI
```

---

## 1. Problem Statement

We need to validate whether Phoenix and Ash Framework provide a viable foundation for building AI-powered SaaS applications that process unstructured content (text files, email threads) through configurable multi-stage pipelines with LLM integration.

Key requirements:
- Stateful processing pipelines with database persistence
- LLM integration for analysis, extraction, categorization
- Structured data outputs from unstructured inputs
- User-triggered execution
- Configurable/dynamic pipeline topologies
- AI coding assistant friendly codebase

---

## 2. Proposed Architecture

### 2.1 Layer Separation

```
┌─────────────────────────────────────────────────────────────┐
│                    Phoenix Web Layer                         │
│              (LiveView, Controllers, Channels)               │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    Ash Domain Layer                          │
│         (Resources, Actions, Policies, AshAI Tools)         │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                  Pipeline Orchestration                      │
│              (GenStage DAG OR AshOban Jobs)                 │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    LLM Integration                           │
│          (AshAI prompt-backed actions OR ReqLLM)            │
└─────────────────────────────────────────────────────────────┘
```

### 2.2 Two Orchestration Options

#### Option A: GenStage DAG (Outside Ash)

GenStage provides backpressure, parallelism, and explicit topology control. Ash handles domain logic and persistence.

```
Producer (content intake)
    │
    ▼
Analyzer Stage (LLM: extract entities, classify)
    │
    ├──▶ Categorizer A (LLM: domain-specific processing)
    │
    └──▶ Categorizer B (LLM: alternate processing path)
            │
            ▼
      Consumer (persist to Ash resources)
```

**Pros:**
- Maximum control over topology, backpressure, concurrency
- State flows explicitly between stages
- Can implement conditional branching at runtime

**Cons:**
- GenStage sits outside Ash's paradigm
- Manual state management between stages
- Two mental models (Ash resources + GenStage topology)

#### Option B: AshOban Job Chains (Inside Ash) - RECOMMENDED FOR POC

AshOban triggers chain jobs together. Each job is an Ash action. State persists in database between jobs.

```
Job A (intake) 
    → triggers → 
Job B (analyze via prompt-backed action)
    → triggers → 
Job C (categorize via prompt-backed action)
    → triggers →
Job D (finalize)
```

**Example Implementation:**

```elixir
defmodule ElixirLizards.Pipeline.Run do
  use Ash.Resource,
    otp_app: :elixir_lizards,
    domain: ElixirLizards.Pipeline,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshOban]

  alias ElixirLizards.Pipeline.Definitions

  oban do
    triggers do
      trigger :process_stage do
        queue :pipeline
        
        action :run_current_stage
        
        # Trigger next stage when this one completes
        on_success fn record ->
          case Definitions.next_stage(record.pipeline_type, record.current_stage) do
            nil -> 
              # No more stages - mark pipeline complete
              Ash.update!(record, %{}, action: :complete)
              
            next_stage ->
              # Schedule next stage by updating and letting AshOban re-trigger
              Ash.update!(record, %{current_stage: next_stage}, action: :advance_stage)
          end
        end
      end
    end
  end

  actions do
    update :run_current_stage do
      # This action is triggered by AshOban
      change fn changeset, _context ->
        run = Ash.Changeset.get_data(changeset)
        
        case Definitions.job_module(run.pipeline_type, run.current_stage) do
          nil ->
            # No job module found - this shouldn't happen if pipeline is well-defined
            Ash.Changeset.add_error(changeset, 
              field: :current_stage, 
              message: "Unknown stage: #{inspect(run.current_stage)}")
            
          job_module ->
            # Execute the stage logic
            case job_module.execute(run) do
              {:ok, result} ->
                changeset
                |> Ash.Changeset.change_attribute(:stage_outputs, 
                    Map.put(run.stage_outputs || %{}, run.current_stage, result))
                    
              {:error, reason} ->
                Ash.Changeset.add_error(changeset,
                  field: :current_stage,
                  message: "Stage failed: #{inspect(reason)}")
            end
        end
      end
    end
  end
end
```

**Pros:**
- Fully within Ash ecosystem
- Automatic persistence, retries, scheduling
- Prompt-backed actions integrate naturally
- Single mental model

**Cons:**
- No backpressure (queue-based, not stream-based)
- Limited topology flexibility (linear chains, not arbitrary DAGs)
- Higher latency (database round-trip between stages)

### 2.3 LLM Integration Options

> **Recommendation:** Start with ReqLLM since `Req` is already a dependency. Evaluate AshAI if deeper Ash integration proves valuable.

#### Option A: AshAI (Prompt-Backed Actions)

```elixir
defmodule ElixirLizards.Pipeline.Analysis do
  use Ash.Resource,
    otp_app: :elixir_lizards,
    domain: ElixirLizards.Pipeline

  actions do
    action :extract_entities, :map do
      argument :content, :string, allow_nil?: false
      
      run prompt(
        LangChain.ChatModels.ChatOpenAI.new!(%{model: "gpt-4o"}),
        tools: false
      )
    end
  end
end
```

**Characteristics:**
- Declarative, schema-driven outputs
- Integrated with Ash type system
- LangChain dependency underneath
- No DSPy-style optimization
- Adds significant dependency tree

#### Option B: ReqLLM (Recommended for POC)

```elixir
# In an Ash generic action or standalone module
defmodule ElixirLizards.Pipeline.Llm do
  @doc "Extract entities from content using structured outputs"
  def extract_entities(content) do
    ReqLLM.generate_object(
      "openai:gpt-4o",
      content,
      [
        entities: [type: {:array, :map}, description: "Named entities found"],
        category: [type: :string, description: "Primary content category"]
      ]
    )
  end
  
  @doc "Classify content into predefined categories"
  def classify(content, categories) do
    prompt = """
    Classify the following content into one of these categories: #{Enum.join(categories, ", ")}
    
    Content: #{content}
    """
    
    ReqLLM.generate_object(
      "openai:gpt-4o",
      prompt,
      [
        category: [type: :string, enum: categories],
        confidence: [type: :number, description: "Confidence 0-1"]
      ]
    )
  end
end
```

**Characteristics:**
- Standalone, minimal dependency (builds on existing Req)
- Multi-provider support (45+ providers)
- Schema-driven structured outputs
- Can be called from AshOban jobs or Ash actions
- Easier to test in isolation

### 2.4 Recommended Hybrid Approach

```
┌─────────────────────────────────────────┐
│           Ash Domain Layer              │
│  - Content resource (intake, storage)   │
│  - Result resource (outputs)            │
│  - Pipeline resource (config, state)    │
│  - Prompt-backed actions for LLM calls  │
└─────────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────┐
│         GenStage Orchestration          │
│  - Topology defined per pipeline type   │
│  - Stages call Ash actions              │
│  - State checkpointed via Ash resources │
└─────────────────────────────────────────┘
```

This separates concerns:
- **Ash**: Domain model, persistence, authorization, LLM tool definitions
- **GenStage**: Flow control, parallelism, backpressure
- **AshAI**: LLM integration within Ash actions

---

## 3. Data Model (Ash Resources)

Resources follow established patterns from `ElixirLizards.Accounts`.

### 3.1 Domain Definition

```elixir
defmodule ElixirLizards.Pipeline do
  use Ash.Domain, otp_app: :elixir_lizards, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource ElixirLizards.Pipeline.Content
    resource ElixirLizards.Pipeline.Run
    resource ElixirLizards.Pipeline.Result
    resource ElixirLizards.Pipeline.LlmCall
  end
end
```

### 3.2 Resources

```elixir
# Content intake
defmodule ElixirLizards.Pipeline.Content do
  use Ash.Resource,
    otp_app: :elixir_lizards,
    domain: ElixirLizards.Pipeline,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "pipeline_contents"
    repo ElixirLizards.Repo
  end

  actions do
    defaults [:read, :destroy]

    create :ingest do
      accept [:source_type, :raw_content, :metadata]
    end
  end

  attributes do
    uuid_primary_key :id
    attribute :source_type, :atom, constraints: [one_of: [:file, :email, :api, :manual]]
    attribute :raw_content, :string, allow_nil?: false
    attribute :metadata, :map, default: %{}
    timestamps()
  end

  relationships do
    has_many :runs, ElixirLizards.Pipeline.Run
  end
end

# Pipeline execution state
defmodule ElixirLizards.Pipeline.Run do
  use Ash.Resource,
    otp_app: :elixir_lizards,
    domain: ElixirLizards.Pipeline,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "pipeline_runs"
    repo ElixirLizards.Repo
  end

  actions do
    defaults [:read]

    create :start do
      accept [:pipeline_type, :content_id]
      change set_attribute(:status, :pending)
      
      # Set initial stage based on pipeline type
      change fn changeset, _context ->
        pipeline_type = Ash.Changeset.get_attribute(changeset, :pipeline_type)
        first_stage = ElixirLizards.Pipeline.Definitions.first_stage(pipeline_type)
        Ash.Changeset.change_attribute(changeset, :current_stage, first_stage)
      end
    end

    update :advance_stage do
      accept [:current_stage, :stage_outputs]
      change set_attribute(:status, :running)
    end

    update :complete do
      change set_attribute(:status, :completed)
    end

    update :fail do
      accept [:error]
      change set_attribute(:status, :failed)
    end
  end

  attributes do
    uuid_primary_key :id
    attribute :pipeline_type, :atom, constraints: [one_of: [:email_analysis, :document_extraction, :custom]]
    attribute :status, :atom, constraints: [one_of: [:pending, :running, :completed, :failed]]
    attribute :current_stage, :atom              # matches stage names in Definitions module
    attribute :stage_outputs, :map, default: %{} # accumulated state, keyed by stage atom
    attribute :error, :map
    timestamps()
  end

  relationships do
    belongs_to :content, ElixirLizards.Pipeline.Content
    has_many :results, ElixirLizards.Pipeline.Result
    has_many :llm_calls, ElixirLizards.Pipeline.LlmCall
  end
end

# Extracted/processed outputs
defmodule ElixirLizards.Pipeline.Result do
  use Ash.Resource,
    otp_app: :elixir_lizards,
    domain: ElixirLizards.Pipeline,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "pipeline_results"
    repo ElixirLizards.Repo
  end

  actions do
    defaults [:read]

    create :record do
      accept [:result_type, :data, :confidence, :stage, :run_id]
    end
  end

  attributes do
    uuid_primary_key :id
    attribute :result_type, :atom  # :entities, :classification, :summary, etc.
    attribute :stage, :atom        # which stage produced this (matches pipeline stage names)
    attribute :data, :map, allow_nil?: false
    attribute :confidence, :float
    timestamps()
  end

  relationships do
    belongs_to :run, ElixirLizards.Pipeline.Run
  end
end

# LLM call tracking (cost, tokens, latency)
defmodule ElixirLizards.Pipeline.LlmCall do
  use Ash.Resource,
    otp_app: :elixir_lizards,
    domain: ElixirLizards.Pipeline,
    data_layer: AshPostgres.DataLayer

  postgres do
    table "pipeline_llm_calls"
    repo ElixirLizards.Repo
  end

  actions do
    defaults [:read]

    create :record do
      accept [:model, :provider, :input_tokens, :output_tokens, :latency_ms, :cost_usd, :stage, :metadata, :run_id]
    end
  end

  attributes do
    uuid_primary_key :id
    attribute :model, :string, allow_nil?: false      # "gpt-4o", "claude-3-opus", etc.
    attribute :provider, :atom                         # :openai, :anthropic, :google
    attribute :input_tokens, :integer
    attribute :output_tokens, :integer
    attribute :latency_ms, :integer
    attribute :cost_usd, :decimal                      # calculated cost
    attribute :stage, :atom                            # which pipeline stage made call
    attribute :metadata, :map, default: %{}            # prompt template, etc.
    timestamps()
  end

  relationships do
    belongs_to :run, ElixirLizards.Pipeline.Run
  end
end
```

---

## 4. Pipeline Topology Definition

### 4.1 Static Pipeline Types (POC)

For POC, pipeline types are defined as atoms with hardcoded stage sequences:

```elixir
defmodule ElixirLizards.Pipeline.Definitions do
  @pipelines %{
    email_analysis: [
      {:extract, ElixirLizards.Pipeline.Jobs.EntityExtractor},
      {:classify, ElixirLizards.Pipeline.Jobs.Classifier},
      {:summarize, ElixirLizards.Pipeline.Jobs.Summarizer}
    ],
    document_extraction: [
      {:parse, ElixirLizards.Pipeline.Jobs.DocumentParser},
      {:extract, ElixirLizards.Pipeline.Jobs.DataExtractor}
    ]
  }
  
  def stages(pipeline_type), do: Map.get(@pipelines, pipeline_type, [])
  
  @doc "Returns first stage for a pipeline type, or nil if no stages defined"
  def first_stage(pipeline_type) do
    case stages(pipeline_type) do
      [{name, _module} | _] -> name
      [] -> nil
    end
  end
  
  @doc "Returns next stage after current_stage, or nil if at end/not found"
  def next_stage(pipeline_type, nil), do: first_stage(pipeline_type)
  def next_stage(pipeline_type, current_stage) when is_atom(current_stage) do
    stages = stages(pipeline_type)
    case Enum.find_index(stages, fn {name, _} -> name == current_stage end) do
      nil -> nil  # current_stage not found in pipeline
      idx -> 
        case Enum.at(stages, idx + 1) do
          {name, _module} -> name
          nil -> nil  # at end of pipeline
        end
    end
  end
  
  @doc "Returns the job module for a given stage, or nil if not found"
  def job_module(pipeline_type, stage_name) when is_atom(stage_name) do
    case Enum.find(stages(pipeline_type), fn {name, _} -> name == stage_name end) do
      {_name, module} -> module
      nil -> nil
    end
  end
end
```

### 4.2 Dynamic Pipelines (Future)

For user-defined pipelines, store topology in database:

```elixir
defmodule ElixirLizards.Pipeline.Definition do
  use Ash.Resource,
    otp_app: :elixir_lizards,
    domain: ElixirLizards.Pipeline,
    data_layer: AshPostgres.DataLayer

  attributes do
    uuid_primary_key :id
    attribute :name, :string, allow_nil?: false
    attribute :stages, {:array, :map}  # [{name: "extract", job_module: "...", config: {...}}]
    attribute :edges, {:array, :map}   # [{from: "extract", to: "classify"}]
    timestamps()
  end
end
```

---

## 5. GenStage Stage Example (Future Escalation)

> **Note:** Only implement if AshOban proves limiting. See Phase 5 evaluation criteria.

```elixir
defmodule ElixirLizards.Pipeline.Stages.Classifier do
  use GenStage
  
  alias ElixirLizards.Pipeline

  def start_link(opts) do
    GenStage.start_link(__MODULE__, opts)
  end
  
  def init(opts) do
    {:producer_consumer, opts, subscribe_to: opts[:subscribe_to]}
  end
  
  def handle_events(events, _from, state) do
    results = Enum.map(events, fn {run_id, content, accumulated_state} ->
      # Call LLM via wrapper module
      {:ok, classification} = Pipeline.Llm.classify(content, [:support, :sales, :general])
      
      # Checkpoint state via Ash action
      {:ok, _run} = Ash.update(Pipeline.Run, run_id, %{
        current_stage: :classify,
        stage_outputs: Map.put(accumulated_state, :classify, classification)
      }, action: :advance_stage)
      
      # Record LLM call metrics
      {:ok, _} = Pipeline.LlmCall
      |> Ash.Changeset.for_create(:record, %{
        run_id: run_id,
        model: "gpt-4o",
        stage: :classify,
        input_tokens: classification.usage.input,
        output_tokens: classification.usage.output
      })
      |> Ash.create()
      
      {run_id, content, Map.put(accumulated_state, :classify, classification.result)}
    end)
    
    {:noreply, results, state}
  end
end
```

---

## 6. Open Questions

1. **Supervision**: How to supervise dynamic pipeline topologies? DynamicSupervisor per pipeline run?

2. **Error Recovery**: GenStage stage failure vs AshOban job retry semantics — which model fits better?

3. **Streaming**: Real-time progress to LiveView — GenStage naturally supports this, AshOban requires pub_sub.

4. **Scale**: At what throughput does GenStage backpressure matter vs AshOban queue depth?

5. **Complexity Budget**: Is the hybrid approach too complex for POC stage? Should we start with pure AshOban?

---

## 7. Evaluation Criteria

| Criterion | Weight | GenStage Hybrid | Pure AshOban |
|-----------|--------|-----------------|--------------|
| Topology flexibility | High | ✓✓✓ | ✓ |
| Backpressure/flow control | Medium | ✓✓✓ | ✗ |
| Persistence/recovery | High | ✓✓ | ✓✓✓ |
| Ash ecosystem integration | High | ✓✓ | ✓✓✓ |
| Implementation complexity | Medium | ✓ | ✓✓✓ |
| AI assistant friendliness | High | ✓✓ | ✓✓✓ |

---

## 8. Recommendation

**Start with Pure AshOban** for the POC:

1. Lower complexity, single paradigm (Ash)
2. Persistence and recovery built-in
3. Prompt-backed actions integrate directly
4. Sufficient for proving out the domain model and LLM integration
5. Well-documented patterns for AI coding assistants

**Graduate to GenStage Hybrid** if:
- Backpressure becomes necessary (high throughput)
- Complex branching/merging topologies required
- Real-time streaming progress critical
- AshOban job chaining proves too limiting

This approach validates the Ash ecosystem investment before adding GenStage complexity.

---

## 9. Next Steps

### Phase 1: Dependencies & Infrastructure
1. [x] Phoenix + Ash + AshPostgres foundation (complete)
2. [ ] Add AshOban dependency and configure Oban
3. [ ] Add LLM integration: either AshAI or ReqLLM (evaluate both)

### Phase 2: Domain Model
4. [ ] Create `ElixirLizards.Pipeline` domain
5. [ ] Implement `Content` resource with `:ingest` action
6. [ ] Implement `Run` resource with state machine actions
7. [ ] Implement `Result` resource
8. [ ] Implement `LlmCall` resource for cost/token tracking
9. [ ] Run migrations and verify via AshAdmin

### Phase 3: Basic LLM Integration
10. [ ] Create prompt-backed action (or ReqLLM wrapper) for entity extraction
11. [ ] Test LLM call with sample content
12. [ ] Verify LlmCall tracking works

### Phase 4: Job Orchestration
13. [ ] Add AshOban triggers to `Run` resource
14. [ ] Implement single-stage job (intake → analyze)
15. [ ] Chain two AshOban jobs (analyze → categorize)
16. [ ] Test job retries and error handling

### Phase 5: Evaluation
17. [ ] Document friction points
18. [ ] Benchmark latency (database round-trips between stages)
19. [ ] Assess whether GenStage escalation needed
20. [ ] Write decision on AshAI vs ReqLLM

---

## 10. References

**Ash Ecosystem:**
- [Ash Framework Documentation](https://hexdocs.pm/ash)
- [AshOban - Background Jobs](https://hexdocs.pm/ash_oban)
- [AshAI - LLM Integration](https://hexdocs.pm/ash_ai)
- [AshPostgres - Data Layer](https://hexdocs.pm/ash_postgres)
- [Ash Resources Guide](https://hexdocs.pm/ash/Ash.Resource.html)

**LLM Integration:**
- [ReqLLM](https://hexdocs.pm/req_llm) - Lightweight multi-provider LLM client
- [LangChain Elixir](https://hexdocs.pm/langchain) - Used by AshAI
- [Instructor Elixir](https://hexdocs.pm/instructor) - Alternative structured outputs

**Orchestration:**
- [Oban](https://hexdocs.pm/oban) - Background job processing
- [GenStage](https://hexdocs.pm/gen_stage) - Demand-driven data processing

**Project Context:**
- [ElixirLizards Accounts Domain](/lib/elixir_lizards/accounts.ex) - Existing pattern reference
- [ElixirLizards User Resource](/lib/elixir_lizards/accounts/user.ex) - Resource pattern reference
