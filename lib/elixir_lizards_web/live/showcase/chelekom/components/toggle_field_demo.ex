defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ToggleFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.ToggleField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Toggle Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Switch-style toggles for on/off settings
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <ToggleField.toggle_field
          name="notifications"
          label="Enable notifications"
          color="primary"
        />
        <ToggleField.toggle_field
          name="dark_mode"
          label="Dark mode"
          color="info"
          checked
        />
        <ToggleField.toggle_field
          name="auto_save"
          label="Auto-save documents"
          color="success"
        />
      </div>
    </div>
    """
  end
end
