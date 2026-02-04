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

      <div class="max-w-md mx-auto space-y-4">
        <ColorField.color_field
          name="primary_color"
          value="#3B82F6"
          label="Primary Color"
        />
        <ColorField.color_field
          name="accent_color"
          value="#10B981"
          label="Accent Color"
          description="Choose your brand accent color"
        />
      </div>
    </div>
    """
  end
end
