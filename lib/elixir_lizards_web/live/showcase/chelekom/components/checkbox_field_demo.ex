defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.CheckboxFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.CheckboxField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Checkbox Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Individual checkbox inputs with color variants
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-6">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Primary Color</h3>
          <CheckboxField.checkbox_field
            name="terms"
            value="accepted"
            label="I accept the terms and conditions"
            color="primary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Success Color (Checked)</h3>
          <CheckboxField.checkbox_field
            name="newsletter"
            value="subscribed"
            label="Subscribe to newsletter"
            color="success"
            checked
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Info Color</h3>
          <CheckboxField.checkbox_field
            name="updates"
            value="opted_in"
            label="Receive product updates"
            color="info"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Warning Color</h3>
          <CheckboxField.checkbox_field
            name="marketing"
            value="opted_in"
            label="Receive marketing emails"
            color="warning"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Reversed Layout</h3>
          <CheckboxField.checkbox_field
            name="remember"
            value="yes"
            label="Remember me"
            color="primary"
            reverse
          />
        </div>
      </div>
    </div>
    """
  end
end
