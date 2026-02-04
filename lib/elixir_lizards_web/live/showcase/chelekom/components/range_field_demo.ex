defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.RangeFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.RangeField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Range Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Slider inputs for selecting numeric ranges
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-6">
        <RangeField.range_field
          name="volume"
          value="50"
          label="Volume"
          color="primary"
        />
        <RangeField.range_field
          name="brightness"
          value="75"
          label="Brightness"
          color="warning"
        />
        <RangeField.range_field
          name="progress"
          value="30"
          label="Progress"
          color="success"
        />
      </div>
    </div>
    """
  end
end
