defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.BlockquoteDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Blockquote

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Blockquote</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Stylized quotation blocks with icons and captions
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Basic Blockquote</h3>
          <Blockquote.blockquote left_border>
            <p>
              The only way to do great work is to love what you do. If you haven't found it yet,
              keep looking. Don't settle.
            </p>
          </Blockquote.blockquote>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">With Caption</h3>
          <Blockquote.blockquote left_border>
            <p>
              Innovation distinguishes between a leader and a follower.
            </p>
            <:caption>
              Steve Jobs
            </:caption>
          </Blockquote.blockquote>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Color Variants</h3>
          <div class="grid gap-4">
            <Blockquote.blockquote variant="default" color="primary" left_border>
              <p>Primary colored blockquote with a left border accent.</p>
            </Blockquote.blockquote>

            <Blockquote.blockquote variant="default" color="success" left_border>
              <p>Success colored blockquote for positive messages.</p>
            </Blockquote.blockquote>

            <Blockquote.blockquote variant="default" color="warning" left_border>
              <p>Warning colored blockquote for important notices.</p>
            </Blockquote.blockquote>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Different Styles</h3>
          <div class="grid gap-4">
            <Blockquote.blockquote variant="bordered" color="secondary" full_border>
              <p>Bordered variant with full border.</p>
            </Blockquote.blockquote>

            <Blockquote.blockquote variant="shadow" color="info">
              <p>Shadow variant for elevated appearance.</p>
            </Blockquote.blockquote>
          </div>
        </div>

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;Blockquote.blockquote left_border color="primary"&gt;
    &lt;p&gt;Your quote text here.&lt;/p&gt;
    &lt;:caption&gt;Author Name&lt;/:caption&gt;
    &lt;/Blockquote.blockquote&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
