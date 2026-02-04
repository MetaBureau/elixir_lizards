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

      <div class="max-w-lg mx-auto">
        <Fieldset.fieldset legend="Personal Information" color="natural">
          <div class="space-y-4">
            <TextField.text_field
              name="first_name"
              value=""
              label="First Name"
              placeholder="John"
              floating="outer"
            />
            <TextField.text_field
              name="last_name"
              value=""
              label="Last Name"
              placeholder="Doe"
              floating="outer"
            />
          </div>
        </Fieldset.fieldset>
      </div>
    </div>
    """
  end
end
