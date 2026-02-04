defmodule ElixirLizardsWeb.Showcase.Chelekom.ComponentDemoLive do
  @moduledoc """
  Mishka Chelekom component library showcase.
  Components are organized by category.
  """
  use ElixirLizardsWeb, :live_view

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    FeedbackDemo,
    FormsDemo,
    GeneralDemo,
    MediaDemo,
    NavigationDemo,
    OverlaysDemo
  }

  @components [
    "Accordion", "Alert", "Avatar", "Badge", "Breadcrumb", "Button", "Card",
    "Divider", "Drawer", "Dropdown", "Footer", "MegaMenu", "Menu", "Modal",
    "Navbar", "Pagination", "Progress", "Rating", "ScrollArea", "Sidebar",
    "Skeleton", "Spinner", "Table", "Tabs", "TextField", "Tooltip"
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
        <!-- General Components -->
        <section :if={@active_category in ["all", "general"]} id="general">
          <div class="text-center mb-8">
            <.badge variant="primary" class="mb-2">General</.badge>
            <h2 class="text-2xl font-bold">General Components</h2>
            <p class="text-base-content/70">Button, Badge, Card, Divider, Accordion, Tabs, Table, Rating</p>
          </div>
          <.live_component module={GeneralDemo} id="general-demo" />
        </section>

        <!-- Navigation Components -->
        <section :if={@active_category in ["all", "navigation"]} id="navigation">
          <div class="text-center mb-8">
            <.badge variant="secondary" class="mb-2">Navigation</.badge>
            <h2 class="text-2xl font-bold">Navigation Components</h2>
            <p class="text-base-content/70">Breadcrumb, Dropdown, MegaMenu, Pagination, Sidebar, ScrollArea, Footer</p>
          </div>
          <.live_component module={NavigationDemo} id="navigation-demo" />
        </section>

        <!-- Feedback Components -->
        <section :if={@active_category in ["all", "feedback"]} id="feedback">
          <div class="text-center mb-8">
            <.badge variant="success" class="mb-2">Feedback</.badge>
            <h2 class="text-2xl font-bold">Feedback Components</h2>
            <p class="text-base-content/70">Alert, Progress, Spinner, Skeleton, Flash</p>
          </div>
          <.live_component module={FeedbackDemo} id="feedback-demo" />
        </section>

        <!-- Overlays Components -->
        <section :if={@active_category in ["all", "overlays"]} id="overlays">
          <div class="text-center mb-8">
            <.badge variant="warning" class="mb-2">Overlays</.badge>
            <h2 class="text-2xl font-bold">Overlay Components</h2>
            <p class="text-base-content/70">Modal, Drawer, Tooltip</p>
          </div>
          <.live_component module={OverlaysDemo} id="overlays-demo" />
        </section>

        <!-- Forms Components -->
        <section :if={@active_category in ["all", "forms"]} id="forms">
          <div class="text-center mb-8">
            <.badge variant="info" class="mb-2">Forms</.badge>
            <h2 class="text-2xl font-bold">Form Components</h2>
            <p class="text-base-content/70">TextField</p>
          </div>
          <.live_component module={FormsDemo} id="forms-demo" />
        </section>

        <!-- Media Components -->
        <section :if={@active_category in ["all", "media"]} id="media">
          <div class="text-center mb-8">
            <.badge variant="error" class="mb-2">Media</.badge>
            <h2 class="text-2xl font-bold">Media Components</h2>
            <p class="text-base-content/70">Avatar</p>
          </div>
          <.live_component module={MediaDemo} id="media-demo" />
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
              <span>{component}</span>
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
