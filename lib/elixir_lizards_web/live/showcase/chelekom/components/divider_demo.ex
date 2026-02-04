defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.DividerDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Divider

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Divider</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Visual separators for content sections
        </p>
      </div>

      <div class="max-w-xl mx-auto space-y-8">
        <Divider.divider />
        <Divider.divider type="dashed" color="primary" />
        <Divider.divider type="dotted" color="secondary">
          <:text>OR</:text>
        </Divider.divider>
        <Divider.divider color="success">
          <:icon name="hero-sparkles" class="px-2 bg-base-100" />
        </Divider.divider>
      </div>
    </div>
    """
  end
end
