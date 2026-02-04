defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.RadioFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.RadioField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Radio Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Radio button inputs for single-selection options
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <RadioField.radio_field
          name="size"
          value="small"
          label="Small"
          color="primary"
        />
        <RadioField.radio_field
          name="size"
          value="medium"
          label="Medium"
          color="primary"
          checked
        />
        <RadioField.radio_field
          name="size"
          value="large"
          label="Large"
          color="primary"
        />
      </div>
    </div>
    """
  end
end
