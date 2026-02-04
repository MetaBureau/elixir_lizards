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
    CheckboxCardDemo,
    CheckboxFieldDemo,
    ColorFieldDemo,
    DateTimeFieldDemo,
    DividerDemo,
    DrawerDemo,
    DropdownDemo,
    EmailFieldDemo,
    FieldsetDemo,
    FileFieldDemo,
    FooterDemo,
    FormWrapperDemo,
    InputFieldDemo,
    MegaMenuDemo,
    ModalDemo,
    NativeSelectDemo,
    NumberFieldDemo,
    PaginationDemo,
    PasswordFieldDemo,
    ProgressDemo,
    RadioCardDemo,
    RadioFieldDemo,
    RangeFieldDemo,
    RatingDemo,
    ScrollAreaDemo,
    SearchFieldDemo,
    SidebarDemo,
    SkeletonDemo,
    SpinnerDemo,
    TableDemo,
    TabsDemo,
    TelFieldDemo,
    TextareaFieldDemo,
    TextFieldDemo,
    ToggleFieldDemo,
    TooltipDemo,
    UrlFieldDemo
  }

  @components [
    # General
    %{name: "Accordion", module: AccordionDemo, category: "general"},
    %{name: "Badge", module: BadgeDemo, category: "general"},
    %{name: "Button", module: ButtonDemo, category: "general"},
    %{name: "Card", module: CardDemo, category: "general"},
    %{name: "Divider", module: DividerDemo, category: "general"},
    %{name: "Rating", module: RatingDemo, category: "general"},
    %{name: "Table", module: TableDemo, category: "general"},
    %{name: "Tabs", module: TabsDemo, category: "general"},
    # Navigation
    %{name: "Breadcrumb", module: BreadcrumbDemo, category: "navigation"},
    %{name: "Dropdown", module: DropdownDemo, category: "navigation"},
    %{name: "Footer", module: FooterDemo, category: "navigation"},
    %{name: "MegaMenu", module: MegaMenuDemo, category: "navigation"},
    %{name: "Pagination", module: PaginationDemo, category: "navigation"},
    %{name: "ScrollArea", module: ScrollAreaDemo, category: "navigation"},
    %{name: "Sidebar", module: SidebarDemo, category: "navigation"},
    # Feedback
    %{name: "Alert", module: AlertDemo, category: "feedback"},
    %{name: "Progress", module: ProgressDemo, category: "feedback"},
    %{name: "Skeleton", module: SkeletonDemo, category: "feedback"},
    %{name: "Spinner", module: SpinnerDemo, category: "feedback"},
    # Overlays
    %{name: "Drawer", module: DrawerDemo, category: "overlays"},
    %{name: "Modal", module: ModalDemo, category: "overlays"},
    %{name: "Tooltip", module: TooltipDemo, category: "overlays"},
    # Media
    %{name: "Avatar", module: AvatarDemo, category: "media"},
    # Forms
    %{name: "CheckboxCard", module: CheckboxCardDemo, category: "forms"},
    %{name: "CheckboxField", module: CheckboxFieldDemo, category: "forms"},
    %{name: "ColorField", module: ColorFieldDemo, category: "forms"},
    %{name: "DateTimeField", module: DateTimeFieldDemo, category: "forms"},
    %{name: "EmailField", module: EmailFieldDemo, category: "forms"},
    %{name: "Fieldset", module: FieldsetDemo, category: "forms"},
    %{name: "FileField", module: FileFieldDemo, category: "forms"},
    %{name: "FormWrapper", module: FormWrapperDemo, category: "forms"},
    %{name: "InputField", module: InputFieldDemo, category: "forms"},
    %{name: "NativeSelect", module: NativeSelectDemo, category: "forms"},
    %{name: "NumberField", module: NumberFieldDemo, category: "forms"},
    %{name: "PasswordField", module: PasswordFieldDemo, category: "forms"},
    %{name: "RadioCard", module: RadioCardDemo, category: "forms"},
    %{name: "RadioField", module: RadioFieldDemo, category: "forms"},
    %{name: "RangeField", module: RangeFieldDemo, category: "forms"},
    %{name: "SearchField", module: SearchFieldDemo, category: "forms"},
    %{name: "TelField", module: TelFieldDemo, category: "forms"},
    %{name: "TextField", module: TextFieldDemo, category: "forms"},
    %{name: "TextareaField", module: TextareaFieldDemo, category: "forms"},
    %{name: "ToggleField", module: ToggleFieldDemo, category: "forms"},
    %{name: "UrlField", module: UrlFieldDemo, category: "forms"}
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
