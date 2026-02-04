defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.BadgeDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Badge

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Badge</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Small indicators with variants, sizes, and optional icons
        </p>
      </div>

      <div class="flex flex-wrap gap-3 justify-center">
        <Badge.badge>Default</Badge.badge>
        <Badge.badge variant="primary">Primary</Badge.badge>
        <Badge.badge variant="secondary">Secondary</Badge.badge>
        <Badge.badge color="success">Success</Badge.badge>
        <Badge.badge color="warning">Warning</Badge.badge>
        <Badge.badge color="error">Error</Badge.badge>
        <Badge.badge variant="outline">Outline</Badge.badge>
      </div>
    </div>
    """
  end
end
