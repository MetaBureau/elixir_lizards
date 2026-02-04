defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TelFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.TelField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Telephone Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Phone number inputs with formatting
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <TelField.tel_field
          name="phone"
          value=""
          label="Phone Number"
          placeholder="+1 (555) 000-0000"
          floating="outer"
        />
        <TelField.tel_field
          name="mobile"
          value=""
          label="Mobile Number"
          placeholder="+1 (555) 000-0000"
          description="We may send SMS notifications"
          floating="outer"
        />
      </div>
    </div>
    """
  end
end
