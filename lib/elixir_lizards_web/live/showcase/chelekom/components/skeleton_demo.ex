defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.SkeletonDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Skeleton

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Skeleton</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Loading placeholders for content that is being fetched
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <div class="flex items-center gap-4">
          <Skeleton.skeleton width="w-12" height="h-12" rounded="full" animated />
          <div class="flex-1 space-y-2">
            <Skeleton.skeleton width="w-3/4" height="small" animated />
            <Skeleton.skeleton width="w-1/2" height="extra_small" animated />
          </div>
        </div>
        <Skeleton.skeleton width="full" height="medium" animated />
        <Skeleton.skeleton width="full" height="extra_large" animated />
      </div>
    </div>
    """
  end
end
