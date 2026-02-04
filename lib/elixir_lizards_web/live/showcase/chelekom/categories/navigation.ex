defmodule ElixirLizardsWeb.Showcase.Chelekom.Categories.Navigation do
  @moduledoc """
  Navigation components: Breadcrumb, Dropdown, Footer, MegaMenu, Menu, Navbar, Pagination, ScrollArea, Sidebar
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    BreadcrumbDemo,
    DropdownDemo,
    FooterDemo,
    MegaMenuDemo,
    MenuDemo,
    NavbarDemo,
    PaginationDemo,
    ScrollAreaDemo,
    SidebarDemo
  }

  @components [
    %{name: "Breadcrumb", module: BreadcrumbDemo},
    %{name: "Dropdown", module: DropdownDemo},
    %{name: "Footer", module: FooterDemo},
    %{name: "MegaMenu", module: MegaMenuDemo},
    %{name: "Menu", module: MenuDemo},
    %{name: "Navbar", module: NavbarDemo},
    %{name: "Pagination", module: PaginationDemo},
    %{name: "ScrollArea", module: ScrollAreaDemo},
    %{name: "Sidebar", module: SidebarDemo}
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
