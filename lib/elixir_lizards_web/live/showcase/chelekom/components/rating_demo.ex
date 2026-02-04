defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.RatingDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Rating

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Rating</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Star ratings for reviews and feedback
        </p>
      </div>

      <div class="space-y-4 flex flex-col items-center">
        <div class="flex items-center gap-4">
          <span class="text-sm">3/5:</span>
          <Rating.rating select={3} count={5} size="medium" />
        </div>
        <div class="flex items-center gap-4">
          <span class="text-sm">4.5/5:</span>
          <Rating.rating select={4.5} count={5} size="large" color="warning" />
        </div>
        <div class="flex items-center gap-4">
          <span class="text-sm">Interactive:</span>
          <Rating.rating select={0} count={5} size="large" color="primary" interactive />
        </div>
      </div>
    </div>
    """
  end
end
