defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ListDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.List

  def render(assigns) do
    ~H"""
    <div id="list-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">List</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Styled lists for navigation, data display, and content organization
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="list-basic" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Basic Unordered List</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <List.list>
              <:item>First item in the list</:item>
              <:item>Second item in the list</:item>
              <:item>Third item in the list</:item>
              <:item>Fourth item in the list</:item>
            </List.list>
          </div>
        </div>

        <div id="list-ordered" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Ordered List with Counts</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <List.list ordered>
              <:item count={1}>First numbered item</:item>
              <:item count={2}>Second numbered item</:item>
              <:item count={3}>Third numbered item</:item>
              <:item count={4}>Fourth numbered item</:item>
            </List.list>
          </div>
        </div>

        <div id="list-icons" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Icons</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <List.list>
              <:item icon="hero-check-circle" icon_class="text-success-light">Completed task</:item>
              <:item icon="hero-clock" icon_class="text-warning-light">Pending task</:item>
              <:item icon="hero-x-circle" icon_class="text-danger-light">Failed task</:item>
              <:item icon="hero-information-circle" icon_class="text-info-light">
                Information item
              </:item>
            </List.list>
          </div>
        </div>

        <div id="list-bordered" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Bordered Variant</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <List.list variant="bordered" color="natural">
              <:item padding="small">Bordered list item one</:item>
              <:item padding="small">Bordered list item two</:item>
              <:item padding="small">Bordered list item three</:item>
            </List.list>
          </div>
        </div>

        <div id="list-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <div class="demo-grid grid md:grid-cols-2 gap-4">
            <div
              id="list-color-primary"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <List.list variant="bordered" color="primary">
                <:item padding="small">Primary item</:item>
                <:item padding="small">Primary item</:item>
              </List.list>
            </div>

            <div
              id="list-color-secondary"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <List.list variant="bordered" color="secondary">
                <:item padding="small">Secondary item</:item>
                <:item padding="small">Secondary item</:item>
              </List.list>
            </div>

            <div
              id="list-color-success"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <List.list variant="bordered" color="success">
                <:item padding="small">Success item</:item>
                <:item padding="small">Success item</:item>
              </List.list>
            </div>

            <div
              id="list-color-warning"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <List.list variant="bordered" color="warning">
                <:item padding="small">Warning item</:item>
                <:item padding="small">Warning item</:item>
              </List.list>
            </div>
          </div>
        </div>

        <div id="list-hoverable" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Hoverable List</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <List.list variant="bordered" hoverable>
              <:item padding="small">Hover over this item</:item>
              <:item padding="small">Hover over this item</:item>
              <:item padding="small">Hover over this item</:item>
            </List.list>
          </div>
        </div>

        <div id="list-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;List.list variant="bordered" hoverable&gt;
    &lt;:item icon="hero-check" padding="small"&gt;List item with icon&lt;/:item&gt;
    &lt;:item padding="small"&gt;Simple list item&lt;/:item&gt;
    &lt;/List.list&gt;

    &lt;List.list ordered&gt;
    &lt;:item count={1}&gt;First item&lt;/:item&gt;
    &lt;:item count={2}&gt;Second item&lt;/:item&gt;
    &lt;/List.list&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
