defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.RadioFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.RadioField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Radio Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Radio button inputs for single-selection with color variants
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Primary Color Group</h3>
          <div class="space-y-2">
            <RadioField.radio_field
              id="size-small"
              name="size"
              value="small"
              label="Small"
              color="primary"
            />
            <RadioField.radio_field
              id="size-medium"
              name="size"
              value="medium"
              label="Medium"
              color="primary"
              checked
            />
            <RadioField.radio_field
              id="size-large"
              name="size"
              value="large"
              label="Large"
              color="primary"
            />
          </div>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Success Color Group</h3>
          <div class="space-y-2">
            <RadioField.radio_field
              id="plan-free"
              name="plan"
              value="free"
              label="Free Plan"
              color="success"
            />
            <RadioField.radio_field
              id="plan-pro"
              name="plan"
              value="pro"
              label="Pro Plan"
              color="success"
              checked
            />
            <RadioField.radio_field
              id="plan-enterprise"
              name="plan"
              value="enterprise"
              label="Enterprise Plan"
              color="success"
            />
          </div>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Reversed Layout</h3>
          <div class="space-y-2">
            <RadioField.radio_field
              id="theme-light"
              name="theme"
              value="light"
              label="Light Theme"
              color="info"
              reverse
            />
            <RadioField.radio_field
              id="theme-dark"
              name="theme"
              value="dark"
              label="Dark Theme"
              color="info"
              reverse
              checked
            />
          </div>
        </div>
      </div>
    </div>
    """
  end
end
