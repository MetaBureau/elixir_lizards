defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TimelineDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Timeline

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Timeline</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Display chronological events and activity logs
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Basic Vertical Timeline</h3>
          <Timeline.timeline hide_last_line>
            <Timeline.timeline_section
              title="Application submitted"
              time="February 2024"
              description="Your application was received and is being reviewed."
            />

            <Timeline.timeline_section
              title="Interview scheduled"
              time="February 2024"
              description="Phone interview scheduled with the hiring manager."
            />

            <Timeline.timeline_section
              title="Technical assessment"
              time="March 2024"
              description="Completed the technical coding challenge."
            />

            <Timeline.timeline_section
              title="Offer extended"
              time="March 2024"
              description="Congratulations! You received an offer letter."
            />
          </Timeline.timeline>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">With Icons</h3>
          <Timeline.timeline hide_last_line>
            <Timeline.timeline_section
              bullet_icon="hero-document-text"
              title="Document created"
              description="New project proposal was created"
              size="large"
            />

            <Timeline.timeline_section
              bullet_icon="hero-pencil"
              title="Document edited"
              description="Made revisions based on feedback"
              size="large"
            />

            <Timeline.timeline_section
              bullet_icon="hero-check-circle"
              title="Document approved"
              description="Final approval received"
              size="large"
            />
          </Timeline.timeline>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Color Variants</h3>
          <Timeline.timeline color="primary" hide_last_line>
            <Timeline.timeline_section
              title="Primary timeline item"
              description="Description for the primary event"
            />

            <Timeline.timeline_section
              title="Another primary item"
              description="More details about this event"
            />
          </Timeline.timeline>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Gapped Sections</h3>
          <Timeline.timeline gapped_sections hide_last_line>
            <Timeline.timeline_section
              title="Step 1"
              description="First step with gap spacing"
            />

            <Timeline.timeline_section
              title="Step 2"
              description="Second step with gap spacing"
            />

            <Timeline.timeline_section
              title="Step 3"
              description="Third step with gap spacing"
            />
          </Timeline.timeline>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">With Custom Content</h3>
          <Timeline.timeline hide_last_line>
            <Timeline.timeline_section
              size="double_large"
              image="https://picsum.photos/seed/user1/100/100"
            >
              <div class="p-3 bg-base-200 rounded-lg">
                <div class="flex items-center justify-between mb-2">
                  <span class="font-medium">Bonnie Green</span>
                  <time class="text-xs text-base-content/60">just now</time>
                </div>
                <p class="text-sm">Updated the project documentation with new guidelines.</p>
              </div>
            </Timeline.timeline_section>

            <Timeline.timeline_section
              size="double_large"
              image="https://picsum.photos/seed/user2/100/100"
            >
              <div class="p-3 bg-base-200 rounded-lg">
                <div class="flex items-center justify-between mb-2">
                  <span class="font-medium">Thomas Lean</span>
                  <time class="text-xs text-base-content/60">2 hours ago</time>
                </div>
                <p class="text-sm">Commented on the pull request with suggestions.</p>
              </div>
            </Timeline.timeline_section>
          </Timeline.timeline>
        </div>

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;Timeline.timeline hide_last_line&gt;
    &lt;Timeline.timeline_section
    bullet_icon="hero-check"
    title="Event Title"
    time="Date"
    description="Event description"
    /&gt;
    &lt;/Timeline.timeline&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
