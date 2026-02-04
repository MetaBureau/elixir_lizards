defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.DateTimeFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.DateTimeField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Date Time Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Date and time inputs with different type variants
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Raw HTML5 Date (for comparison)</h3>
          <input type="date" name="raw_date" class="border p-2 rounded" />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Date</h3>
          <DateTimeField.date_time_field
            id="date_input"
            name="date_field"
            value=""
            type="date"
            label="Select a date"
            space="large"
            color="misc"
            description="This is description"
            size="small"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">DateTime Local</h3>
          <DateTimeField.date_time_field
            id="datetime_input"
            name="datetime_field"
            value=""
            type="datetime-local"
            label="Select date and time"
            space="small"
            color="primary"
            description="This is description"
            floating="outer"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Time</h3>
          <DateTimeField.date_time_field
            id="time_input"
            name="time_field"
            value=""
            type="time"
            label="Select a time"
            space="small"
            color="danger"
            floating="outer"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Week</h3>
          <DateTimeField.date_time_field
            id="week_input"
            name="week_field"
            value=""
            type="week"
            label="Select a week"
            space="large"
            color="secondary"
            description="This is description"
            size="medium"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Month</h3>
          <DateTimeField.date_time_field
            id="month_input"
            name="month_field"
            value=""
            type="month"
            label="Select a month"
            space="large"
            color="dawn"
            description="This is description"
            size="large"
          />
        </div>
      </div>
    </div>
    """
  end
end
