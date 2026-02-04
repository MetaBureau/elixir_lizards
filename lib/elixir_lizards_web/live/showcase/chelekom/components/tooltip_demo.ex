defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TooltipDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Button, Tooltip}

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Tooltip</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Contextual information on hover for enhanced UX
        </p>
      </div>

      <div class="flex flex-wrap gap-6 justify-center">
        <Tooltip.tooltip position="top" color="natural">
          <:trigger>
            <Button.button variant="outline" color="primary">Top Tooltip</Button.button>
          </:trigger>
          <:content>Tooltip on top</:content>
        </Tooltip.tooltip>

        <Tooltip.tooltip position="bottom" color="primary">
          <:trigger>
            <Button.button variant="outline" color="primary">Bottom Tooltip</Button.button>
          </:trigger>
          <:content>Tooltip on bottom</:content>
        </Tooltip.tooltip>

        <Tooltip.tooltip position="left" color="success">
          <:trigger>
            <Button.button variant="outline" color="primary">Left Tooltip</Button.button>
          </:trigger>
          <:content>Tooltip on left</:content>
        </Tooltip.tooltip>

        <Tooltip.tooltip position="right" color="warning">
          <:trigger>
            <Button.button variant="outline" color="primary">Right Tooltip</Button.button>
          </:trigger>
          <:content>Tooltip on right</:content>
        </Tooltip.tooltip>
      </div>
    </div>
    """
  end
end
