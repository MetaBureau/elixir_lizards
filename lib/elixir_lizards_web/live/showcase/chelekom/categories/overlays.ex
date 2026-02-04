defmodule ElixirLizardsWeb.Showcase.Chelekom.Categories.Overlays do
  @moduledoc """
  Overlay components: Drawer, Modal, Overlay, Popover, Tooltip
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    DrawerDemo,
    ModalDemo,
    OverlayDemo,
    PopoverDemo,
    TooltipDemo
  }

  @components [
    %{name: "Drawer", module: DrawerDemo},
    %{name: "Modal", module: ModalDemo},
    %{name: "Overlay", module: OverlayDemo},
    %{name: "Popover", module: PopoverDemo},
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
