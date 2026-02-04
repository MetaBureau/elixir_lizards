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

      <div class="max-w-2xl mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Outline Variant</h3>
          <PasswordField.password_field
            name="password"
            value=""
            label="Password"
            placeholder="Enter your password"
            floating="outer"
            variant="outline"
            color="primary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Description</h3>
          <PasswordField.password_field
            name="new_password"
            value=""
            label="New Password"
            placeholder="Create a strong password"
            description="Must be at least 8 characters"
            floating="outer"
            variant="outline"
            color="natural"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Shadow Variant</h3>
          <PasswordField.password_field
            name="confirm_password"
            value=""
            label="Confirm Password"
            placeholder="Confirm your password"
            floating="outer"
            variant="shadow"
            color="secondary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Icon</h3>
          <PasswordField.password_field
            name="secure_password"
            value=""
            label="Secure Password"
            placeholder="Enter password"
            floating="outer"
            variant="outline"
            color="success"
          >
            <:start_section>
              <.icon name="hero-lock-closed" class="size-5" />
            </:start_section>
          </PasswordField.password_field>
        </div>
      </div>
    </div>
    """
  end
end
