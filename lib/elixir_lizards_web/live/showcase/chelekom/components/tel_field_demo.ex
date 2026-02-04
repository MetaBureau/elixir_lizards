defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TelFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.TelField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Telephone Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Phone number inputs with country code sections
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Country Code</h3>
          <TelField.tel_field
            name="phone"
            value=""
            label="Phone Number"
            placeholder="(555) 000-0000"
            floating="outer"
            variant="outline"
            color="primary"
          >
            <:start_section>
              <span class="text-base-content/60">+1</span>
            </:start_section>
          </TelField.tel_field>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Description</h3>
          <TelField.tel_field
            name="mobile"
            value=""
            label="Mobile Number"
            placeholder="(555) 000-0000"
            description="We may send SMS notifications"
            floating="outer"
            variant="outline"
            color="natural"
          >
            <:start_section>
              <.icon name="hero-device-phone-mobile" class="size-5" />
            </:start_section>
          </TelField.tel_field>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Shadow Variant</h3>
          <TelField.tel_field
            name="work_phone"
            value=""
            label="Work Phone"
            placeholder="(555) 000-0000"
            floating="outer"
            variant="shadow"
            color="secondary"
          />
        </div>
      </div>
    </div>
    """
  end
end
