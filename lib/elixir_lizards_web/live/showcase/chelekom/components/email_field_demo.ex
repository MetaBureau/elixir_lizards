defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.EmailFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.EmailField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Email Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Email input fields with validation and styling
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <EmailField.email_field
          name="email"
          value=""
          label="Email Address"
          placeholder="you@example.com"
          floating="outer"
        />
        <EmailField.email_field
          name="work_email"
          value=""
          label="Work Email"
          placeholder="name@company.com"
          description="Use your company email address"
          floating="outer"
        />
      </div>
    </div>
    """
  end
end
