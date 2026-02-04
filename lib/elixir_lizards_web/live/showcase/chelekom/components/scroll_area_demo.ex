defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ScrollAreaDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.ScrollArea

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Scroll Area</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Custom scrollable containers with styled scrollbars
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6 max-w-4xl mx-auto">
        <div>
          <h3 class="text-lg font-semibold mb-3">Vertical Scroll</h3>
          <ScrollArea.scroll_area id="chelekom-scroll-1" height="h-48" padding="small" class="border border-base-300 rounded-lg">
            <div class="space-y-4">
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
              <p>Ut enim ad minim veniam, quis nostrud exercitation.</p>
              <p>Duis aute irure dolor in reprehenderit in voluptate.</p>
              <p>Excepteur sint occaecat cupidatat non proident.</p>
              <p>Sed ut perspiciatis unde omnis iste natus error.</p>
              <p>Totam rem aperiam, eaque ipsa quae ab illo inventore.</p>
            </div>
          </ScrollArea.scroll_area>
        </div>

        <div>
          <h3 class="text-lg font-semibold mb-3">Content List</h3>
          <ScrollArea.scroll_area id="chelekom-scroll-2" height="h-48" padding="extra_small" class="border border-base-300 rounded-lg">
            <ul class="divide-y divide-base-300">
              <li :for={i <- 1..12} class="p-3 hover:bg-base-200 transition-colors">
                <div class="flex items-center gap-3">
                  <div class="rounded-full bg-primary/10 p-2">
                    <.icon name="hero-document" class="size-4 text-primary" />
                  </div>
                  <div>
                    <div class="font-medium">Item {i}</div>
                    <div class="text-sm text-base-content/60">Description</div>
                  </div>
                </div>
              </li>
            </ul>
          </ScrollArea.scroll_area>
        </div>
      </div>
    </div>
    """
  end
end
