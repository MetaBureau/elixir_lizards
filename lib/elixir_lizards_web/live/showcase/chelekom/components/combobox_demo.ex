defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ComboboxDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Combobox

  def render(assigns) do
    ~H"""
    <div id="combobox-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Combobox</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Searchable dropdown select with filtering and multiple selection
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="combobox-basic" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Basic Combobox</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item max-w-md">
              <Combobox.combobox name="fruit" placeholder="Select an option" label="Choose a fruit">
                <:option value="apple">Apple</:option>
                <:option value="banana">Banana</:option>
                <:option value="cherry">Cherry</:option>
                <:option value="date">Date</:option>
                <:option value="elderberry">Elderberry</:option>
              </Combobox.combobox>
            </div>
          </div>
        </div>

        <div id="combobox-searchable" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Searchable Combobox</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item max-w-md">
              <Combobox.combobox
                id="combobox-country"
                name="country"
                searchable
                placeholder="Search countries..."
                label="Select a country"
                search_placeholder="Type to filter..."
              >
                <:option value="us">United States</:option>
                <:option value="uk">United Kingdom</:option>
                <:option value="ca">Canada</:option>
                <:option value="au">Australia</:option>
                <:option value="de">Germany</:option>
                <:option value="fr">France</:option>
                <:option value="jp">Japan</:option>
                <:option value="br">Brazil</:option>
              </Combobox.combobox>
            </div>
          </div>
        </div>

        <div id="combobox-multiple" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Multiple Selection</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item max-w-md">
              <Combobox.combobox
                name="technologies[]"
                multiple
                searchable
                placeholder="Select technologies..."
                label="Technologies you know"
              >
                <:option value="elixir">Elixir</:option>
                <:option value="phoenix">Phoenix</:option>
                <:option value="liveview">LiveView</:option>
                <:option value="tailwind">Tailwind CSS</:option>
                <:option value="postgresql">PostgreSQL</:option>
                <:option value="javascript">JavaScript</:option>
                <:option value="typescript">TypeScript</:option>
              </Combobox.combobox>
            </div>
          </div>
        </div>

        <div id="combobox-grouped" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Grouped Options</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item max-w-md">
              <Combobox.combobox
                name="language"
                searchable
                placeholder="Select a programming language..."
                label="Programming Language"
              >
                <:option group="Functional" value="elixir">Elixir</:option>
                <:option group="Functional" value="haskell">Haskell</:option>
                <:option group="Functional" value="erlang">Erlang</:option>
                <:option group="Object-Oriented" value="java">Java</:option>
                <:option group="Object-Oriented" value="python">Python</:option>
                <:option group="Object-Oriented" value="ruby">Ruby</:option>
                <:option group="Systems" value="rust">Rust</:option>
                <:option group="Systems" value="go">Go</:option>
                <:option group="Systems" value="c">C</:option>
              </Combobox.combobox>
            </div>
          </div>
        </div>

        <div id="combobox-description" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Description</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item max-w-md">
              <Combobox.combobox
                name="role"
                placeholder="Select your role..."
                label="User Role"
                description="This determines your permissions in the system"
              >
                <:option value="admin">Administrator</:option>
                <:option value="editor">Editor</:option>
                <:option value="viewer">Viewer</:option>
                <:option value="guest">Guest</:option>
              </Combobox.combobox>
            </div>
          </div>
        </div>

        <div id="combobox-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-grid grid md:grid-cols-2 gap-4">
              <div id="combobox-color-primary" class="demo-item">
                <Combobox.combobox
                  name="primary_opt"
                  color="primary"
                  placeholder="Primary color"
                  label="Primary"
                >
                  <:option value="1">Option 1</:option>
                  <:option value="2">Option 2</:option>
                </Combobox.combobox>
              </div>

              <div id="combobox-color-secondary" class="demo-item">
                <Combobox.combobox
                  name="secondary_opt"
                  color="secondary"
                  placeholder="Secondary color"
                  label="Secondary"
                >
                  <:option value="1">Option 1</:option>
                  <:option value="2">Option 2</:option>
                </Combobox.combobox>
              </div>

              <div id="combobox-color-success" class="demo-item">
                <Combobox.combobox
                  name="success_opt"
                  color="success"
                  placeholder="Success color"
                  label="Success"
                >
                  <:option value="1">Option 1</:option>
                  <:option value="2">Option 2</:option>
                </Combobox.combobox>
              </div>

              <div id="combobox-color-danger" class="demo-item">
                <Combobox.combobox
                  name="danger_opt"
                  color="danger"
                  placeholder="Danger color"
                  label="Danger"
                >
                  <:option value="1">Option 1</:option>
                  <:option value="2">Option 2</:option>
                </Combobox.combobox>
              </div>
            </div>
          </div>
        </div>

        <div id="combobox-disabled" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Disabled Option</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item max-w-md">
              <Combobox.combobox
                id="combobox-plan"
                name="plan"
                placeholder="Select a plan..."
                label="Subscription Plan"
              >
                <:option value="free">Free</:option>
                <:option value="basic">Basic</:option>
                <:option value="pro" disabled>Pro (Coming Soon)</:option>
                <:option value="enterprise" disabled>Enterprise (Coming Soon)</:option>
              </Combobox.combobox>
            </div>
          </div>
        </div>

        <div id="combobox-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;Combobox.combobox
    name="my_select"
    searchable
    multiple
    placeholder="Select items..."
    label="Select Options"
    description="Choose one or more"
    &gt;
    &lt;:option value="opt1"&gt;Option 1&lt;/:option&gt;
    &lt;:option value="opt2"&gt;Option 2&lt;/:option&gt;
    &lt;:option value="opt3" disabled&gt;Option 3 (Disabled)&lt;/:option&gt;
    &lt;/Combobox.combobox&gt;

    &lt;!-- With grouped options --&gt;
    &lt;Combobox.combobox name="grouped" searchable placeholder="Select..."&gt;
    &lt;:option group="Group A" value="a1"&gt;A1&lt;/:option&gt;
    &lt;:option group="Group A" value="a2"&gt;A2&lt;/:option&gt;
    &lt;:option group="Group B" value="b1"&gt;B1&lt;/:option&gt;
    &lt;/Combobox.combobox&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
