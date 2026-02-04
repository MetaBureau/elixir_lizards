defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.SearchFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.SearchField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Search Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Search inputs with clear button and styling
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <SearchField.search_field
          name="search"
          value=""
          label="Search"
          placeholder="Search..."
          floating="outer"
        />
        <SearchField.search_field
          name="filter"
          value=""
          label="Filter Results"
          placeholder="Type to filter..."
          description="Search by name, email, or ID"
          floating="outer"
        />
      </div>
    </div>
    """
  end
end
