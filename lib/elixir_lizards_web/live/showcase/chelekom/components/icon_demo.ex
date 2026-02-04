defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.IconDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Icon

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Icon</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Hero Icons integration for displaying scalable vector icons
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <!-- Basic Icons -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Basic Icons</h3>
          <div class="flex flex-wrap gap-4 items-center justify-center">
            <div class="flex flex-col items-center gap-2 p-4 bg-base-200 rounded-lg">
              <Icon.icon name="hero-home" class="size-6" />
              <span class="text-xs">home</span>
            </div>
            <div class="flex flex-col items-center gap-2 p-4 bg-base-200 rounded-lg">
              <Icon.icon name="hero-user" class="size-6" />
              <span class="text-xs">user</span>
            </div>
            <div class="flex flex-col items-center gap-2 p-4 bg-base-200 rounded-lg">
              <Icon.icon name="hero-cog-6-tooth" class="size-6" />
              <span class="text-xs">cog</span>
            </div>
            <div class="flex flex-col items-center gap-2 p-4 bg-base-200 rounded-lg">
              <Icon.icon name="hero-bell" class="size-6" />
              <span class="text-xs">bell</span>
            </div>
            <div class="flex flex-col items-center gap-2 p-4 bg-base-200 rounded-lg">
              <Icon.icon name="hero-envelope" class="size-6" />
              <span class="text-xs">envelope</span>
            </div>
            <div class="flex flex-col items-center gap-2 p-4 bg-base-200 rounded-lg">
              <Icon.icon name="hero-heart" class="size-6" />
              <span class="text-xs">heart</span>
            </div>
          </div>
        </div>
        
    <!-- Solid vs Outline -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Solid vs Outline</h3>
          <div class="flex flex-wrap gap-6 items-center justify-center">
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-star" class="size-8" />
              <span class="text-xs">Outline</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-star-solid" class="size-8" />
              <span class="text-xs">Solid</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-heart" class="size-8" />
              <span class="text-xs">Outline</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-heart-solid" class="size-8" />
              <span class="text-xs">Solid</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-bookmark" class="size-8" />
              <span class="text-xs">Outline</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-bookmark-solid" class="size-8" />
              <span class="text-xs">Solid</span>
            </div>
          </div>
        </div>
        
    <!-- Sizes -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Sizes</h3>
          <div class="flex flex-wrap gap-6 items-end justify-center">
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-bell" class="size-4" />
              <span class="text-xs">size-4</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-bell" class="size-5" />
              <span class="text-xs">size-5</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-bell" class="size-6" />
              <span class="text-xs">size-6</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-bell" class="size-8" />
              <span class="text-xs">size-8</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-bell" class="size-10" />
              <span class="text-xs">size-10</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-bell" class="size-12" />
              <span class="text-xs">size-12</span>
            </div>
          </div>
        </div>
        
    <!-- Colors -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Colors</h3>
          <div class="flex flex-wrap gap-4 items-center justify-center">
            <Icon.icon name="hero-check-circle-solid" class="size-8 text-success" />
            <Icon.icon name="hero-exclamation-circle-solid" class="size-8 text-warning" />
            <Icon.icon name="hero-x-circle-solid" class="size-8 text-error" />
            <Icon.icon name="hero-information-circle-solid" class="size-8 text-info" />
            <Icon.icon name="hero-star-solid" class="size-8 text-primary" />
            <Icon.icon name="hero-heart-solid" class="size-8 text-secondary" />
          </div>
        </div>
        
    <!-- Animations -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Animations</h3>
          <div class="flex flex-wrap gap-6 items-center justify-center">
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-arrow-path" class="size-8 animate-spin" />
              <span class="text-xs">spin</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-arrow-down" class="size-8 animate-bounce" />
              <span class="text-xs">bounce</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-bell" class="size-8 animate-pulse" />
              <span class="text-xs">pulse</span>
            </div>
            <div class="flex flex-col items-center gap-2">
              <Icon.icon name="hero-signal" class="size-8 animate-ping" />
              <span class="text-xs">ping</span>
            </div>
          </div>
        </div>
        
    <!-- Common UI Icons -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Common UI Icons</h3>
          <div class="grid grid-cols-4 md:grid-cols-8 gap-4">
            <div class="flex flex-col items-center gap-1 p-2">
              <Icon.icon name="hero-plus" class="size-5" />
              <span class="text-xs">plus</span>
            </div>
            <div class="flex flex-col items-center gap-1 p-2">
              <Icon.icon name="hero-minus" class="size-5" />
              <span class="text-xs">minus</span>
            </div>
            <div class="flex flex-col items-center gap-1 p-2">
              <Icon.icon name="hero-x-mark" class="size-5" />
              <span class="text-xs">x-mark</span>
            </div>
            <div class="flex flex-col items-center gap-1 p-2">
              <Icon.icon name="hero-check" class="size-5" />
              <span class="text-xs">check</span>
            </div>
            <div class="flex flex-col items-center gap-1 p-2">
              <Icon.icon name="hero-pencil" class="size-5" />
              <span class="text-xs">pencil</span>
            </div>
            <div class="flex flex-col items-center gap-1 p-2">
              <Icon.icon name="hero-trash" class="size-5" />
              <span class="text-xs">trash</span>
            </div>
            <div class="flex flex-col items-center gap-1 p-2">
              <Icon.icon name="hero-magnifying-glass" class="size-5" />
              <span class="text-xs">search</span>
            </div>
            <div class="flex flex-col items-center gap-1 p-2">
              <Icon.icon name="hero-funnel" class="size-5" />
              <span class="text-xs">filter</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
