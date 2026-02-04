defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ToggleFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.ToggleField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Toggle Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Switch-style toggles with color variants
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-6">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Primary Color</h3>
          <ToggleField.toggle_field
            name="notifications"
            label="Enable notifications"
            color="primary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Success Color (Checked)</h3>
          <ToggleField.toggle_field
            name="active"
            label="Account active"
            color="success"
            checked
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Info Color</h3>
          <ToggleField.toggle_field
            name="dark_mode"
            label="Dark mode"
            color="info"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Warning Color</h3>
          <ToggleField.toggle_field
            name="beta_features"
            label="Enable beta features"
            color="warning"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Danger Color</h3>
          <ToggleField.toggle_field
            name="delete_confirm"
            label="Confirm deletion"
            color="danger"
          />
        </div>
      </div>
    </div>
    """
  end
end
