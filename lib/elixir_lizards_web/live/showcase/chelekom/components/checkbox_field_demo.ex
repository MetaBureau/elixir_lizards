defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.CheckboxFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.CheckboxField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Checkbox Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Customizable checkbox inputs with labels and validation states
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <CheckboxField.checkbox_field
          name="terms"
          value="accepted"
          label="Accept terms and conditions"
          color="primary"
        />
        <CheckboxField.checkbox_field
          name="newsletter"
          value="subscribed"
          label="Subscribe to newsletter"
          color="success"
          checked
        />
        <CheckboxField.checkbox_field
          name="marketing"
          value="opted_in"
          label="Receive marketing emails"
          color="info"
        />
      </div>
    </div>
    """
  end
end
