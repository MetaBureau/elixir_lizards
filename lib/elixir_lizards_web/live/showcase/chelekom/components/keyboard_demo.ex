defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.KeyboardDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Keyboard

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Keyboard</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Display keyboard keys and shortcuts in documentation
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Basic Keys</h3>
          <div class="flex flex-wrap gap-2 items-center">
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

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Special Keys</h3>
          <div class="flex flex-wrap gap-2">
            <Keyboard.keyboard>Esc</Keyboard.keyboard>
            <Keyboard.keyboard>Tab</Keyboard.keyboard>
            <Keyboard.keyboard>Shift</Keyboard.keyboard>
            <Keyboard.keyboard>Enter</Keyboard.keyboard>
            <Keyboard.keyboard>Space</Keyboard.keyboard>
            <Keyboard.keyboard>Backspace</Keyboard.keyboard>
            <Keyboard.keyboard>Delete</Keyboard.keyboard>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Arrow Keys</h3>
          <div class="flex flex-wrap gap-2">
            <Keyboard.keyboard>↑</Keyboard.keyboard>
            <Keyboard.keyboard>↓</Keyboard.keyboard>
            <Keyboard.keyboard>←</Keyboard.keyboard>
            <Keyboard.keyboard>→</Keyboard.keyboard>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Color Variants</h3>
          <div class="flex flex-wrap gap-2">
            <Keyboard.keyboard color="natural">Natural</Keyboard.keyboard>
            <Keyboard.keyboard color="primary">Primary</Keyboard.keyboard>
            <Keyboard.keyboard color="secondary">Secondary</Keyboard.keyboard>
            <Keyboard.keyboard color="success">Success</Keyboard.keyboard>
            <Keyboard.keyboard color="warning">Warning</Keyboard.keyboard>
            <Keyboard.keyboard color="danger">Danger</Keyboard.keyboard>
            <Keyboard.keyboard color="info">Info</Keyboard.keyboard>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Sizes</h3>
          <div class="flex flex-wrap gap-2 items-center">
            <Keyboard.keyboard size="extra_small">XS</Keyboard.keyboard>
            <Keyboard.keyboard size="small">Small</Keyboard.keyboard>
            <Keyboard.keyboard size="medium">Medium</Keyboard.keyboard>
            <Keyboard.keyboard size="large">Large</Keyboard.keyboard>
            <Keyboard.keyboard size="extra_large">XL</Keyboard.keyboard>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">In Context</h3>
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

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;p&gt;
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
