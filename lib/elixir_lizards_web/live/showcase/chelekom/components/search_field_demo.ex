defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.SearchFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.SearchField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Search Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Search inputs with icon and clear functionality
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Search Icon</h3>
          <SearchField.search_field
            name="search"
            value=""
            label="Search"
            placeholder="Search..."
            floating="outer"
            variant="outline"
            color="primary"
          >
            <:start_section>
              <.icon name="hero-magnifying-glass" class="size-5" />
            </:start_section>
          </SearchField.search_field>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Description</h3>
          <SearchField.search_field
            name="filter"
            value=""
            label="Filter Results"
            placeholder="Type to filter..."
            description="Search by name, email, or ID"
            floating="outer"
            variant="outline"
            color="natural"
          >
            <:start_section>
              <.icon name="hero-funnel" class="size-5" />
            </:start_section>
          </SearchField.search_field>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Shadow Variant</h3>
          <SearchField.search_field
            name="global_search"
            value=""
            label="Global Search"
            placeholder="Search everywhere..."
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
