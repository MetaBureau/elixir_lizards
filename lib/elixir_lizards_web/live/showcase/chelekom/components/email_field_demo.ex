defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.EmailFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.EmailField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Email Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Email inputs with validation styling and variants
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Outline Variant</h3>
          <EmailField.email_field
            name="email"
            value=""
            label="Email Address"
            placeholder="you@example.com"
            description="We'll never share your email"
            floating="outer"
            variant="outline"
            color="primary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Icon</h3>
          <EmailField.email_field
            name="work_email"
            value=""
            label="Work Email"
            placeholder="name@company.com"
            floating="outer"
            variant="outline"
            color="natural"
          >
            <:start_section>
              <.icon name="hero-envelope" class="size-5" />
            </:start_section>
          </EmailField.email_field>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Shadow Variant</h3>
          <EmailField.email_field
            name="contact_email"
            value=""
            label="Contact Email"
            placeholder="contact@example.com"
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
