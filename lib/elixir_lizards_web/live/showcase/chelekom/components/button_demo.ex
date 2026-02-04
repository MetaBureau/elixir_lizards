defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ButtonDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Button

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Button</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Interactive buttons with variants, sizes, and states
        </p>
      </div>

      <div class="space-y-4">
        <div>
          <h3 class="text-lg font-semibold mb-3 text-center">Variants</h3>
          <div class="flex flex-wrap gap-3 justify-center">
            <Button.button variant="default" color="primary">Default</Button.button>
            <Button.button variant="outline" color="primary">Outline</Button.button>
            <Button.button variant="subtle" color="primary">Subtle</Button.button>
            <Button.button variant="shadow" color="primary">Shadow</Button.button>
            <Button.button variant="inverted" color="primary">Inverted</Button.button>
          </div>
        </div>

        <div>
          <h3 class="text-lg font-semibold mb-3 text-center">Colors</h3>
          <div class="flex flex-wrap gap-3 justify-center">
            <Button.button variant="default" color="primary">Primary</Button.button>
            <Button.button variant="default" color="secondary">Secondary</Button.button>
            <Button.button variant="default" color="success">Success</Button.button>
            <Button.button variant="default" color="warning">Warning</Button.button>
            <Button.button variant="default" color="danger">Danger</Button.button>
            <Button.button variant="default" color="info">Info</Button.button>
          </div>
        </div>

        <div>
          <h3 class="text-lg font-semibold mb-3 text-center">Sizes</h3>
          <div class="flex flex-wrap gap-3 justify-center items-center">
            <Button.button variant="default" color="primary" size="extra_small">XS</Button.button>
            <Button.button variant="default" color="primary" size="small">SM</Button.button>
            <Button.button variant="default" color="primary" size="medium">MD</Button.button>
            <Button.button variant="default" color="primary" size="large">LG</Button.button>
            <Button.button variant="default" color="primary" size="extra_large">XL</Button.button>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
