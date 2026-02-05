defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.PaginationDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Pagination

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Pagination</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Navigate through pages of content
        </p>
      </div>

      <div class="space-y-6 flex flex-col items-center">
        <Pagination.pagination total={10} active={3} siblings={1} />
        <Pagination.pagination
          total={20}
          active={7}
          siblings={2}
          variant="outline"
          color="primary"
          show_edges
        />
      </div>
    </div>
    """
  end
end
