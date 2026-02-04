defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ProgressDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Progress

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Progress</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Visual indicators for task completion and loading states
        </p>
      </div>

      <div class="space-y-4 max-w-xl mx-auto">
        <Progress.progress value={25} color="primary" size="small" />
        <Progress.progress value={50} color="secondary" size="medium" />
        <Progress.progress value={75} color="success" size="large" />
        <Progress.progress value={90} color="warning" size="extra_large" />
      </div>
    </div>
    """
  end
end
