defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.UrlFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.UrlField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">URL Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          URL inputs with protocol prefix sections
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Protocol Prefix</h3>
          <UrlField.url_field
            name="website"
            value=""
            label="Website"
            placeholder="example.com"
            floating="outer"
            variant="outline"
            color="primary"
          >
            <:start_section>
              <span class="text-base-content/60">https://</span>
            </:start_section>
          </UrlField.url_field>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Description</h3>
          <UrlField.url_field
            name="linkedin"
            value=""
            label="LinkedIn Profile"
            placeholder="linkedin.com/in/username"
            description="Your professional profile URL"
            floating="outer"
            variant="outline"
            color="natural"
          >
            <:start_section>
              <.icon name="hero-link" class="size-5" />
            </:start_section>
          </UrlField.url_field>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Shadow Variant</h3>
          <UrlField.url_field
            name="portfolio"
            value=""
            label="Portfolio"
            placeholder="myportfolio.com"
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
