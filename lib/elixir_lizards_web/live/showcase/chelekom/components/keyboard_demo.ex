defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.KeyboardDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Keyboard

  def render(assigns) do
    ~H"""
    <div id="keyboard-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Keyboard</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Display keyboard keys and shortcuts in documentation
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="keyboard-basic" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Basic Keys</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-2 items-center">
              <Keyboard.keyboard>Ctrl</Keyboard.keyboard>
              <span>+</span>
              <Keyboard.keyboard>C</Keyboard.keyboard>
              <span class="mx-4">Copy</span>

              <Keyboard.keyboard>Ctrl</Keyboard.keyboard>
              <span>+</span>
              <Keyboard.keyboard>V</Keyboard.keyboard>
              <span class="mx-4">Paste</span>

              <Keyboard.keyboard>Ctrl</Keyboard.keyboard>
              <span>+</span>
              <Keyboard.keyboard>Z</Keyboard.keyboard>
              <span class="mx-4">Undo</span>
            </div>
          </div>
        </div>

        <div id="keyboard-special" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Special Keys</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-2">
              <Keyboard.keyboard>Esc</Keyboard.keyboard>
              <Keyboard.keyboard>Tab</Keyboard.keyboard>
              <Keyboard.keyboard>Shift</Keyboard.keyboard>
              <Keyboard.keyboard>Enter</Keyboard.keyboard>
              <Keyboard.keyboard>Space</Keyboard.keyboard>
              <Keyboard.keyboard>Backspace</Keyboard.keyboard>
              <Keyboard.keyboard>Delete</Keyboard.keyboard>
            </div>
          </div>
        </div>

        <div id="keyboard-arrows" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Arrow Keys</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-2">
              <Keyboard.keyboard>↑</Keyboard.keyboard>
              <Keyboard.keyboard>↓</Keyboard.keyboard>
              <Keyboard.keyboard>←</Keyboard.keyboard>
              <Keyboard.keyboard>→</Keyboard.keyboard>
            </div>
          </div>
        </div>

        <div id="keyboard-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-2">
              <Keyboard.keyboard color="natural">Natural</Keyboard.keyboard>
              <Keyboard.keyboard color="primary">Primary</Keyboard.keyboard>
              <Keyboard.keyboard color="secondary">Secondary</Keyboard.keyboard>
              <Keyboard.keyboard color="success">Success</Keyboard.keyboard>
              <Keyboard.keyboard color="warning">Warning</Keyboard.keyboard>
              <Keyboard.keyboard color="danger">Danger</Keyboard.keyboard>
              <Keyboard.keyboard color="info">Info</Keyboard.keyboard>
            </div>
          </div>
        </div>

        <div id="keyboard-sizes" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Sizes</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-2 items-center">
              <Keyboard.keyboard size="extra_small">XS</Keyboard.keyboard>
              <Keyboard.keyboard size="small">Small</Keyboard.keyboard>
              <Keyboard.keyboard size="medium">Medium</Keyboard.keyboard>
              <Keyboard.keyboard size="large">Large</Keyboard.keyboard>
              <Keyboard.keyboard size="extra_large">XL</Keyboard.keyboard>
            </div>
          </div>
        </div>

        <div id="keyboard-context" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">In Context</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <p class="text-base-content/80">
              Press
              <Keyboard.keyboard>Ctrl</Keyboard.keyboard>
              +
              <Keyboard.keyboard>K</Keyboard.keyboard>
              to open the command palette,
              or use
              <Keyboard.keyboard>Esc</Keyboard.keyboard>
              to close any modal.
              Navigate with
              <Keyboard.keyboard>↑</Keyboard.keyboard>
              and
              <Keyboard.keyboard>↓</Keyboard.keyboard>
              arrow keys.
            </p>
          </div>
        </div>

        <div id="keyboard-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;p&gt;
    Press &lt;Keyboard.keyboard&gt;Ctrl&lt;/Keyboard.keyboard&gt; +
    &lt;Keyboard.keyboard&gt;S&lt;/Keyboard.keyboard&gt; to save.
    &lt;/p&gt;

    &lt;Keyboard.keyboard color="primary" size="medium"&gt;Enter&lt;/Keyboard.keyboard&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
