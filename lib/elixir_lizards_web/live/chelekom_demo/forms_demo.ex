defmodule ElixirLizardsWeb.ChelekomDemo.FormsDemo do
  @moduledoc """
  Forms components demo: TextField
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.TextField

  def render(assigns) do
    ~H"""
    <div class="space-y-12">
      <!-- Text Field -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Text Field</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Form inputs with labels, descriptions, and validation states
          </p>
        </div>

        <div class="max-w-md mx-auto space-y-4">
          <TextField.text_field
            name="demo_name"
            value=""
            label="Your Name"
            placeholder="Enter your name"
            floating="outer"
          />
          <TextField.text_field
            name="demo_email"
            value=""
            label="Email Address"
            placeholder="you@example.com"
            description="We'll never share your email"
            floating="outer"
          />
          <TextField.text_field
            name="demo_error"
            value="invalid"
            label="With Error"
            color="danger"
            floating="outer"
          >
            <:end_section>
              <.icon name="hero-exclamation-circle" class="size-5 text-error" />
            </:end_section>
          </TextField.text_field>
        </div>
      </section>
    </div>
    """
  end
end
