defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.DateTimeFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.DateTimeField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Date Time Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Date and time picker inputs
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <DateTimeField.date_time_field
          name="start_date"
          value=""
          label="Start Date"
          type="date"
          floating="outer"
        />
        <DateTimeField.date_time_field
          name="appointment"
          value=""
          label="Appointment Time"
          type="datetime-local"
          description="Select date and time"
          floating="outer"
        />
      </div>
    </div>
    """
  end
end
