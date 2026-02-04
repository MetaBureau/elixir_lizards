defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.FormWrapperDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Button, FormWrapper, TextField}

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Form Wrapper</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Styled form container with consistent spacing
        </p>
      </div>

      <div class="max-w-lg mx-auto">
        <FormWrapper.form_wrapper for={%{}} phx-submit="demo_submit">
          <div class="space-y-4">
            <TextField.text_field
              name="username"
              value=""
              label="Username"
              placeholder="Enter username"
              floating="outer"
            />
            <TextField.text_field
              name="email"
              value=""
              label="Email"
              placeholder="you@example.com"
              floating="outer"
            />
          </div>
          <:actions>
            <Button.button variant="default" color="primary" type="submit">
              Submit
            </Button.button>
          </:actions>
        </FormWrapper.form_wrapper>
      </div>
    </div>
    """
  end
end
