defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.UrlFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.UrlField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">URL Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          URL inputs with validation and formatting
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <UrlField.url_field
          name="website"
          value=""
          label="Website"
          placeholder="https://example.com"
          floating="outer"
        />
        <UrlField.url_field
          name="linkedin"
          value=""
          label="LinkedIn Profile"
          placeholder="https://linkedin.com/in/username"
          description="Your professional profile URL"
          floating="outer"
        />
      </div>
    </div>
    """
  end
end
