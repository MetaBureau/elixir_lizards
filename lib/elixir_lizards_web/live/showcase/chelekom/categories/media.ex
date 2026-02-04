defmodule ElixirLizardsWeb.Showcase.Chelekom.Categories.Media do
  @moduledoc """
  Media components: Avatar, Carousel
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    AvatarDemo,
    CarouselDemo
  }

  @components [
    %{name: "Avatar", module: AvatarDemo},
    %{name: "Carousel", module: CarouselDemo}
  ]

  def components, do: @components

  def render(assigns) do
    assigns = assign(assigns, :components, @components)

    ~H"""
    <div class="space-y-16">
      <section :for={component <- @components}>
        <.live_component
          module={component.module}
          id={"#{String.downcase(component.name)}-demo"}
        />
      </section>
    </div>
    """
  end
end
