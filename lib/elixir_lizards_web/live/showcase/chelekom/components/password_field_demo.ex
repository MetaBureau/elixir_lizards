defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.PasswordFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.PasswordField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Password Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Secure password inputs with visibility toggle
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <PasswordField.password_field
          name="password"
          value=""
          label="Password"
          placeholder="Enter your password"
          floating="outer"
        />
        <PasswordField.password_field
          name="confirm_password"
          value=""
          label="Confirm Password"
          placeholder="Confirm your password"
          description="Passwords must match"
          floating="outer"
        />
      </div>
    </div>
    """
  end
end
