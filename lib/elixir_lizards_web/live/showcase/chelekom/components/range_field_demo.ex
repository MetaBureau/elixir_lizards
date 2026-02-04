defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.RangeFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.RangeField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Range Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Slider inputs with color variants for selecting values
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Primary Color</h3>
          <RangeField.range_field
            name="volume"
            value="50"
            label="Volume"
            color="primary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Success Color</h3>
          <RangeField.range_field
            name="progress"
            value="75"
            label="Progress"
            color="success"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Warning Color</h3>
          <RangeField.range_field
            name="brightness"
            value="60"
            label="Brightness"
            color="warning"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Info Color</h3>
          <RangeField.range_field
            name="opacity"
            value="80"
            label="Opacity"
            color="info"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Danger Color</h3>
          <RangeField.range_field
            name="threshold"
            value="30"
            label="Alert Threshold"
            color="danger"
          />
        </div>
      </div>
    </div>
    """
  end
end
