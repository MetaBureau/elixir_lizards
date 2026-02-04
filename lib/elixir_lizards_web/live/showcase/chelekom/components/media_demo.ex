defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.MediaDemo do
  @moduledoc """
  Media components demo: Avatar
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Avatar

  def render(assigns) do
    ~H"""
    <div class="space-y-12">
      <!-- Avatar -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Avatar</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            User profile images with various sizes, shapes, and styles
          </p>
        </div>

        <div class="flex flex-wrap gap-4 justify-center items-end">
          <Avatar.avatar size="extra_small" rounded="full" color="primary">
            <:icon name="hero-user" />
          </Avatar.avatar>
          <Avatar.avatar size="small" rounded="full" color="secondary">
            <:icon name="hero-user" />
          </Avatar.avatar>
          <Avatar.avatar size="medium" rounded="full" color="success">
            <:icon name="hero-user" />
          </Avatar.avatar>
          <Avatar.avatar size="large" rounded="full" color="warning">
            <:icon name="hero-user" />
          </Avatar.avatar>
          <Avatar.avatar size="extra_large" rounded="full" color="info">
            <:icon name="hero-user" />
          </Avatar.avatar>
          <Avatar.avatar size="medium" rounded="medium" color="silver">
            <:icon name="hero-user" />
          </Avatar.avatar>
        </div>
      </section>
    </div>
    """
  end
end
