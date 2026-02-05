defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ClipboardDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Clipboard

  def render(assigns) do
    ~H"""
    <div id="clipboard-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Clipboard</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Copy-to-clipboard functionality with visual feedback
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="clipboard-basic" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Basic Clipboard</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-4">
              <Clipboard.clipboard
                text="Hello, World!"
                copy_success_text="Copied!"
                copy_error_text="Failed to copy"
              >
                <:trigger>
                  <button class="d-btn d-btn-primary">Copy Text</button>
                </:trigger>
              </Clipboard.clipboard>

              <Clipboard.clipboard
                text="npm install phoenix_live_view"
                copy_success_text="Command copied!"
              >
                <:trigger>
                  <button class="d-btn d-btn-outline">Copy Command</button>
                </:trigger>
              </Clipboard.clipboard>
            </div>
          </div>
        </div>

        <div id="clipboard-from-element" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Copy from Element</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg space-y-4">
            <div id="code-sample" class="demo-code-block p-4 bg-base-300 rounded-lg font-mono text-sm">
              defmodule MyApp.Hello do
              def world, do: "Hello, World!"
              end
            </div>
            <Clipboard.clipboard target_selector="#code-sample" copy_success_text="Code copied!">
              <:trigger>
                <button class="d-btn d-btn-secondary d-btn-sm">Copy Code Above</button>
              </:trigger>
            </Clipboard.clipboard>
          </div>
        </div>

        <div id="clipboard-with-content" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Content Display</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <Clipboard.clipboard text="secret-api-key-12345" copy_success_text="API Key copied!">
              <:content>
                <code class="text-sm bg-base-300 px-2 py-1 rounded">secret-api-key-12345</code>
              </:content>
              <:trigger>
                <button class="d-btn d-btn-ghost d-btn-sm">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-4 w-4"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"
                    />
                  </svg>
                </button>
              </:trigger>
            </Clipboard.clipboard>
          </div>
        </div>

        <div id="clipboard-dynamic" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Dynamic Label Change</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <Clipboard.clipboard
              text="Copied text content"
              dynamic_label={true}
              copy_success_text="Copied!"
            >
              <:trigger>
                <button class="d-btn d-btn-info">
                  <span class="clipboard-label">Click to Copy</span>
                </button>
              </:trigger>
            </Clipboard.clipboard>
          </div>
        </div>

        <div id="clipboard-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;Clipboard.clipboard text="Text to copy" copy_success_text="Copied!"&gt;
    &lt;:trigger&gt;
    &lt;button class="d-btn"&gt;Copy&lt;/button&gt;
    &lt;/:trigger&gt;
    &lt;/Clipboard.clipboard&gt;

    &lt;!-- Copy from element --&gt;
    &lt;div id="my-content"&gt;Content to copy&lt;/div&gt;
    &lt;Clipboard.clipboard target_selector="#my-content"&gt;
    &lt;:trigger&gt;&lt;button&gt;Copy Content&lt;/button&gt;&lt;/:trigger&gt;
    &lt;/Clipboard.clipboard&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
