defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TextFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.TextField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Text Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Text inputs with variants, floating labels, and start/end sections
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <!-- Default with floating outer label -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Floating Outer Label</h3>
          <TextField.text_field
            name="username"
            value=""
            label="Username"
            placeholder="Enter your username"
            floating="outer"
            variant="outline"
            color="natural"
          />
        </div>

        <!-- With description -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Description</h3>
          <TextField.text_field
            name="email"
            value=""
            label="Email Address"
            placeholder="you@example.com"
            description="We'll never share your email with anyone"
            floating="outer"
            variant="outline"
            color="primary"
          />
        </div>

        <!-- With start section (icon) -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Start Icon</h3>
          <TextField.text_field
            name="search"
            value=""
            label="Search"
            placeholder="Search..."
            floating="outer"
            variant="outline"
            color="natural"
          >
            <:start_section>
              <.icon name="hero-magnifying-glass" class="size-5" />
            </:start_section>
          </TextField.text_field>
        </div>

        <!-- With end section -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With End Section</h3>
          <TextField.text_field
            name="website"
            value=""
            label="Website"
            placeholder="example.com"
            floating="outer"
            variant="outline"
            color="natural"
          >
            <:start_section>
              <span class="text-base-content/60">https://</span>
            </:start_section>
            <:end_section>
              <span class="text-base-content/60">.com</span>
            </:end_section>
          </TextField.text_field>
        </div>

        <!-- Shadow variant -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Shadow Variant</h3>
          <TextField.text_field
            name="company"
            value=""
            label="Company Name"
            placeholder="Acme Inc."
            floating="outer"
            variant="shadow"
            color="secondary"
          />
        </div>

        <!-- Inner floating label -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Floating Inner Label</h3>
          <TextField.text_field
            name="fullname"
            value=""
            label="Full Name"
            placeholder=" "
            floating="inner"
            variant="outline"
            color="primary"
          />
        </div>

        <!-- Error state -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Error State</h3>
          <TextField.text_field
            name="invalid"
            value="invalid-input"
            label="With Error"
            floating="outer"
            variant="outline"
            color="danger"
            errors={["This field is required"]}
          />
        </div>
      </div>
    </div>
    """
  end
end
