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
        <Badge.badge variant="default" color="natural">Default</Badge.badge>
        <Badge.badge variant="default" color="primary">Primary</Badge.badge>
        <Badge.badge variant="default" color="secondary">Secondary</Badge.badge>
        <Badge.badge variant="default" color="success">Success</Badge.badge>
        <Badge.badge variant="default" color="warning">Warning</Badge.badge>
        <Badge.badge variant="default" color="danger">Danger</Badge.badge>
        <Badge.badge variant="default" color="info">Info</Badge.badge>
        <Badge.badge variant="outline" color="primary">Outline</Badge.badge>
      </div>
    </div>
    """
  end
end
