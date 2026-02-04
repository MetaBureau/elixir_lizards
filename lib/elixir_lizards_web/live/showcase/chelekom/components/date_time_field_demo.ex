defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.DateTimeFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.DateTimeField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Date Time Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Date and time inputs with variants
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Date Input</h3>
          <DateTimeField.date_time_field
            name="start_date"
            value=""
            label="Start Date"
            type="date"
            floating="outer"
            variant="outline"
            color="primary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">DateTime Input</h3>
          <DateTimeField.date_time_field
            name="appointment"
            value=""
            label="Appointment"
            type="datetime-local"
            description="Select date and time"
            floating="outer"
            variant="outline"
            color="natural"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Time Input</h3>
          <DateTimeField.date_time_field
            name="meeting_time"
            value=""
            label="Meeting Time"
            type="time"
            floating="outer"
            variant="shadow"
            color="secondary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Month Input</h3>
          <DateTimeField.date_time_field
            name="birth_month"
            value=""
            label="Birth Month"
            type="month"
            floating="outer"
            variant="outline"
            color="info"
          />
        </div>
      </div>
    </div>
    """
  end
end
