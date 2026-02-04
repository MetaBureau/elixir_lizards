defmodule ElixirLizardsWeb.Showcase.Chelekom.Categories.Media do
  @moduledoc """
  Media components: Avatar, Carousel, Image
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    AvatarDemo,
    CarouselDemo,
    ImageDemo
  }

  @components [
    %{name: "Avatar", module: AvatarDemo},
    %{name: "Carousel", module: CarouselDemo},
    %{name: "Image", module: ImageDemo}
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
