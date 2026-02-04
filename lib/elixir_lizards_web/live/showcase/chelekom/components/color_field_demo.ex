defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ColorFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.ColorField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Color Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Color picker inputs for selecting colors
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-6">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Primary Color Theme</h3>
          <ColorField.color_field
            name="primary_color"
            value="#3B82F6"
            label="Primary Color"
            color="primary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Description</h3>
          <ColorField.color_field
            name="accent_color"
            value="#10B981"
            label="Accent Color"
            description="Choose your brand accent color"
            color="success"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Secondary Theme</h3>
          <ColorField.color_field
            name="background_color"
            value="#6366F1"
            label="Background Color"
            color="secondary"
          />
        </div>
      </div>
    </div>
    """
  end
end
