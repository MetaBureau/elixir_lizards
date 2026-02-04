defmodule ElixirLizardsWeb.Showcase.Chelekom.ComponentDemoLive do
  @moduledoc """
  Mishka Chelekom component library showcase.
  Each component has its own demo file.
  """
  use ElixirLizardsWeb, :live_view

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    AccordionDemo,
    AlertDemo,
    AvatarDemo,
    BadgeDemo,
    BreadcrumbDemo,
    ButtonDemo,
    CardDemo,
    DividerDemo,
    DrawerDemo,
    DropdownDemo,
    FooterDemo,
    MegaMenuDemo,
    ModalDemo,
    PaginationDemo,
    ProgressDemo,
    RatingDemo,
    ScrollAreaDemo,
    SidebarDemo,
    SkeletonDemo,
    SpinnerDemo,
    TableDemo,
    TabsDemo,
    TextFieldDemo,
    TooltipDemo
  }

  @components [
    %{name: "Accordion", module: AccordionDemo, category: "general"},
    %{name: "Alert", module: AlertDemo, category: "feedback"},
    %{name: "Avatar", module: AvatarDemo, category: "media"},
    %{name: "Badge", module: BadgeDemo, category: "general"},
    %{name: "Breadcrumb", module: BreadcrumbDemo, category: "navigation"},
    %{name: "Button", module: ButtonDemo, category: "general"},
    %{name: "Card", module: CardDemo, category: "general"},
    %{name: "Divider", module: DividerDemo, category: "general"},
    %{name: "Drawer", module: DrawerDemo, category: "overlays"},
    %{name: "Dropdown", module: DropdownDemo, category: "navigation"},
    %{name: "Footer", module: FooterDemo, category: "navigation"},
    %{name: "MegaMenu", module: MegaMenuDemo, category: "navigation"},
    %{name: "Modal", module: ModalDemo, category: "overlays"},
    %{name: "Pagination", module: PaginationDemo, category: "navigation"},
    %{name: "Progress", module: ProgressDemo, category: "feedback"},
    %{name: "Rating", module: RatingDemo, category: "general"},
    %{name: "ScrollArea", module: ScrollAreaDemo, category: "navigation"},
    %{name: "Sidebar", module: SidebarDemo, category: "navigation"},
    %{name: "Skeleton", module: SkeletonDemo, category: "feedback"},
    %{name: "Spinner", module: SpinnerDemo, category: "feedback"},
    %{name: "Table", module: TableDemo, category: "general"},
    %{name: "Tabs", module: TabsDemo, category: "general"},
    %{name: "TextField", module: TextFieldDemo, category: "forms"},
    %{name: "Tooltip", module: TooltipDemo, category: "overlays"}
  ]

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Mishka Chelekom Components")
     |> assign(:components, @components)
     |> assign(:active_category, "all")}
  end

  @impl true
  def handle_event("select_category", %{"category" => category}, socket) do
    {:noreply, assign(socket, :active_category, category)}
  end

  defp filtered_components(components, "all"), do: components
  defp filtered_components(components, category) do
    Enum.filter(components, &(&1.category == category))
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/dev/components">Components</:crumb>
        <:crumb>Chelekom</:crumb>
      </.breadcrumb>

      <.header>
        Mishka Chelekom Components
        <:subtitle>Modern, customizable UI components for Phoenix LiveView</:subtitle>
        <:actions>
          <.button navigate="/dev/components/daisyui">DaisyUI Components</.button>
        </:actions>
      </.header>

      <!-- Category Filter -->
      <div class="flex flex-wrap gap-2 justify-center my-8">
        <button
          :for={category <- ["all", "general", "navigation", "feedback", "overlays", "forms", "media"]}
          phx-click="select_category"
          phx-value-category={category}
          class={[
            "btn btn-sm",
            @active_category == category && "btn-primary",
            @active_category != category && "btn-ghost"
          ]}
        >
          {String.capitalize(category)}
        </button>
      </div>

      <div class="space-y-16">
        <section :for={component <- filtered_components(@components, @active_category)}>
          <.live_component
            module={component.module}
            id={"#{String.downcase(component.name)}-demo"}
          />
        </section>

        <!-- Installation Summary -->
        <section class="space-y-6">
          <div class="text-center">
            <h2 class="text-3xl font-bold mb-2">{length(@components)} Components Installed</h2>
            <p class="text-base-content/70 max-w-2xl mx-auto">
              Mishka Chelekom components are ready to use in your application
            </p>
          </div>

          <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-2 max-w-4xl mx-auto text-sm">
            <div :for={component <- @components} class="flex items-center gap-2 p-2 rounded bg-base-200">
              <.icon name="hero-check" class="size-4 text-success" />
              <span>{component.name}</span>
            </div>
          </div>

          <div class="text-center mt-6">
            <p class="text-sm text-base-content/70">
              Access this showcase at: <code class="bg-base-200 px-2 py-1 rounded">/dev/components/chelekom</code>
            </p>
          </div>
        </section>
      </div>
    </Layouts.app>
    """
  end
end
