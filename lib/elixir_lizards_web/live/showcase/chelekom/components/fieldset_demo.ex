defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.FieldsetDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Fieldset, TextField}

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Fieldset</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Group related form fields with a legend
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Default Variant</h3>
          <Fieldset.fieldset
            id="personal-info-fieldset"
            legend="Personal Information"
            variant="default"
            color="natural"
          >
            <div class="space-y-4">
              <TextField.text_field
                name="first_name"
                value=""
                label="First Name"
                placeholder="John"
                floating="outer"
                variant="outline"
                color="natural"
              />
              <TextField.text_field
                name="last_name"
                value=""
                label="Last Name"
                placeholder="Doe"
                floating="outer"
                variant="outline"
                color="natural"
              />
            </div>
          </Fieldset.fieldset>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Outline Variant</h3>
          <Fieldset.fieldset
            id="contact-details-fieldset"
            legend="Contact Details"
            variant="outline"
            color="primary"
          >
            <div class="space-y-4">
              <TextField.text_field
                name="email"
                value=""
                label="Email"
                placeholder="you@example.com"
                floating="outer"
                variant="outline"
                color="primary"
              />
              <TextField.text_field
                name="phone"
                value=""
                label="Phone"
                placeholder="+1 (555) 000-0000"
                floating="outer"
                variant="outline"
                color="primary"
              />
            </div>
          </Fieldset.fieldset>
        </div>
      </div>
    </div>
    """
  end
end
