defmodule ElixirLizardsWeb.Showcase.Chelekom.Categories.Overlays do
  @moduledoc """
  Overlay components: Drawer, Modal, Tooltip
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    DrawerDemo,
    ModalDemo,
    TooltipDemo
  }

  @components [
    %{name: "Drawer", module: DrawerDemo},
    %{name: "Modal", module: ModalDemo},
    %{name: "Tooltip", module: TooltipDemo}
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
