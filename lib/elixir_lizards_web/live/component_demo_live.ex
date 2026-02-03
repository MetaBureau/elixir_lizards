defmodule ElixirLizardsWeb.ComponentDemoLive do
  @moduledoc """
  A dev-only LiveView that showcases all DaisyUI components.
  """
  use ElixirLizardsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Component Demo")
     |> assign(:active_tab, "all")
     |> assign(:show_modal, false)}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, assign(socket, :active_tab, params["tab"] || "all")}
  end

  @impl true
  def handle_event("open-modal", _params, socket) do
    {:noreply, assign(socket, :show_modal, true)}
  end

  @impl true
  def handle_event("close-modal", _params, socket) do
    {:noreply, assign(socket, :show_modal, false)}
  end

  @impl true
  def handle_event("confirm-action", _params, socket) do
    {:noreply,
     socket
     |> assign(:show_modal, false)
     |> put_flash(:info, "Action confirmed!")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb>Dev</:crumb>
        <:crumb>Components</:crumb>
      </.breadcrumb>

      <.header>
        Component Library Demo
        <:subtitle>Showcasing all DaisyUI components built for ElixirLizards</:subtitle>
      </.header>

      <.tabs variant="boxed" class="mb-8">
        <:tab patch="/dev/components?tab=all" active={@active_tab == "all"}>All</:tab>
        <:tab patch="/dev/components?tab=feedback" active={@active_tab == "feedback"}>Feedback</:tab>
        <:tab patch="/dev/components?tab=data" active={@active_tab == "data"}>Data Display</:tab>
        <:tab patch="/dev/components?tab=navigation" active={@active_tab == "navigation"}>
          Navigation
        </:tab>
      </.tabs>

      <div class="space-y-12">
        <%!-- Modal Section --%>
        <section :if={@active_tab in ["all", "feedback"]} id="modal-section">
          <h2 class="text-xl font-bold mb-4 border-b border-base-300 pb-2">Modal</h2>
          <p class="text-base-content/70 mb-4">
            Modal dialogs for confirmations, forms, and focused interactions.
          </p>

          <.button phx-click={show_modal("demo-modal")}>Open Modal</.button>

          <.modal id="demo-modal" on_cancel={hide_modal("demo-modal")}>
            <:title>Confirm Action</:title>
            <:subtitle>This action cannot be undone.</:subtitle>
            <p>Are you sure you want to proceed with this action?</p>
            <:actions>
              <.button class="btn-ghost" phx-click={hide_modal("demo-modal")}>Cancel</.button>
              <.button variant="primary" phx-click="confirm-action">Confirm</.button>
            </:actions>
          </.modal>
        </section>

        <%!-- Card Section --%>
        <section :if={@active_tab in ["all", "data"]} id="card-section">
          <h2 class="text-xl font-bold mb-4 border-b border-base-300 pb-2">Card</h2>
          <p class="text-base-content/70 mb-4">
            Flexible content containers for displaying grouped information.
          </p>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <.card>
              <:title>Simple Card</:title>
              <:body>
                This is a basic card with just a title and body content.
              </:body>
            </.card>

            <.card variant="bordered">
              <:title>Bordered Card</:title>
              <:body>
                A card with a visible border for emphasis.
              </:body>
              <:actions>
                <.button>Action</.button>
              </:actions>
            </.card>

            <.card variant="compact">
              <:figure>
                <div class="bg-primary/20 h-32 w-full flex items-center justify-center">
                  <.icon name="hero-photo" class="size-12 text-primary" />
                </div>
              </:figure>
              <:title>Card with Figure</:title>
              <:body>A compact card with an image placeholder.</:body>
            </.card>
          </div>
        </section>

        <%!-- Badge Section --%>
        <section :if={@active_tab in ["all", "data"]} id="badge-section">
          <h2 class="text-xl font-bold mb-4 border-b border-base-300 pb-2">Badge</h2>
          <p class="text-base-content/70 mb-4">
            Status indicators and labels for categorization.
          </p>

          <div class="flex flex-wrap gap-2 mb-4">
            <.badge>Default</.badge>
            <.badge variant="primary">Primary</.badge>
            <.badge variant="secondary">Secondary</.badge>
            <.badge variant="accent">Accent</.badge>
            <.badge variant="ghost">Ghost</.badge>
          </div>

          <div class="flex flex-wrap gap-2 mb-4">
            <.badge variant="info">Info</.badge>
            <.badge variant="success">Success</.badge>
            <.badge variant="warning">Warning</.badge>
            <.badge variant="error">Error</.badge>
          </div>

          <div class="flex flex-wrap gap-2 mb-4">
            <.badge variant="primary" outline>Outline</.badge>
            <.badge variant="success" outline>Outline</.badge>
            <.badge variant="error" outline>Outline</.badge>
          </div>

          <div class="flex flex-wrap gap-2 items-center">
            <.badge size="xs">XS</.badge>
            <.badge size="sm">SM</.badge>
            <.badge size="md">MD</.badge>
            <.badge size="lg">LG</.badge>
          </div>
        </section>

        <%!-- Dropdown Section --%>
        <section :if={@active_tab in ["all", "navigation"]} id="dropdown-section">
          <h2 class="text-xl font-bold mb-4 border-b border-base-300 pb-2">Dropdown</h2>
          <p class="text-base-content/70 mb-4">
            Contextual menus triggered by buttons or other elements.
          </p>

          <div class="flex gap-4">
            <.dropdown>
              <:trigger><.button>Click Menu</.button></:trigger>
              <:item>Profile</:item>
              <:item>Settings</:item>
              <:item>Notifications</:item>
              <:item navigate={~p"/"}>Home</:item>
            </.dropdown>

            <.dropdown hover>
              <:trigger><.button>Hover Menu</.button></:trigger>
              <:item>Option 1</:item>
              <:item>Option 2</:item>
              <:item>Option 3</:item>
            </.dropdown>

            <.dropdown position="end">
              <:trigger><.button>End Position</.button></:trigger>
              <:item>Item A</:item>
              <:item>Item B</:item>
            </.dropdown>
          </div>
        </section>

        <%!-- Avatar Section --%>
        <section :if={@active_tab in ["all", "data"]} id="avatar-section">
          <h2 class="text-xl font-bold mb-4 border-b border-base-300 pb-2">Avatar</h2>
          <p class="text-base-content/70 mb-4">
            User profile images with fallbacks and status indicators.
          </p>

          <div class="flex items-center gap-4 mb-4">
            <.avatar placeholder="JD" size="xs" />
            <.avatar placeholder="AB" size="sm" />
            <.avatar placeholder="CD" size="md" />
            <.avatar placeholder="EF" size="lg" />
            <.avatar placeholder="GH" size="xl" />
          </div>

          <div class="flex items-center gap-4 mb-4">
            <.avatar placeholder="ON" status="online" />
            <.avatar placeholder="OF" status="offline" />
          </div>

          <div class="flex items-center gap-4">
            <.avatar placeholder="C" shape="circle" />
            <.avatar placeholder="S" shape="squircle" />
            <.avatar placeholder="H" shape="hexagon" />
            <.avatar placeholder="T" shape="triangle" />
          </div>
        </section>

        <%!-- Stats Section --%>
        <section :if={@active_tab in ["all", "data"]} id="stats-section">
          <h2 class="text-xl font-bold mb-4 border-b border-base-300 pb-2">Stats</h2>
          <p class="text-base-content/70 mb-4">
            Display key metrics and statistics in a clean format.
          </p>

          <.stat_group class="w-full">
            <.stat title="Total Users" value="31,245" description="+12% from last month" />
            <.stat
              title="Revenue"
              value="$12,500"
              description="Current month"
              icon="hero-currency-dollar"
              variant="success"
            />
            <.stat
              title="Tasks"
              value="86%"
              description="Completed"
              icon="hero-check-circle"
              variant="info"
            />
          </.stat_group>
        </section>

        <%!-- Empty State Section --%>
        <section :if={@active_tab in ["all", "feedback"]} id="empty-state-section">
          <h2 class="text-xl font-bold mb-4 border-b border-base-300 pb-2">Empty State</h2>
          <p class="text-base-content/70 mb-4">
            Placeholder content for empty collections or search results.
          </p>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div class="border border-base-300 rounded-lg">
              <.empty_state title="No documents yet">
                <:description>Get started by creating your first document.</:description>
                <:action><.button>Create Document</.button></:action>
              </.empty_state>
            </div>

            <div class="border border-base-300 rounded-lg">
              <.empty_state icon="hero-magnifying-glass" title="No results found">
                <:description>Try adjusting your search or filters.</:description>
              </.empty_state>
            </div>
          </div>
        </section>

        <%!-- Tabs Section --%>
        <section :if={@active_tab in ["all", "navigation"]} id="tabs-section">
          <h2 class="text-xl font-bold mb-4 border-b border-base-300 pb-2">Tabs</h2>
          <p class="text-base-content/70 mb-4">
            Navigation tabs for switching between views.
          </p>

          <div class="space-y-4">
            <div>
              <p class="text-sm font-medium mb-2">Default</p>
              <.tabs>
                <:tab active>Tab 1</:tab>
                <:tab>Tab 2</:tab>
                <:tab>Tab 3</:tab>
              </.tabs>
            </div>

            <div>
              <p class="text-sm font-medium mb-2">Boxed</p>
              <.tabs variant="boxed">
                <:tab active>Tab 1</:tab>
                <:tab>Tab 2</:tab>
                <:tab disabled>Disabled</:tab>
              </.tabs>
            </div>

            <div>
              <p class="text-sm font-medium mb-2">Bordered</p>
              <.tabs variant="bordered">
                <:tab active>Tab 1</:tab>
                <:tab>Tab 2</:tab>
                <:tab>Tab 3</:tab>
              </.tabs>
            </div>

            <div>
              <p class="text-sm font-medium mb-2">Lifted</p>
              <.tabs variant="lifted">
                <:tab active>Tab 1</:tab>
                <:tab>Tab 2</:tab>
                <:tab>Tab 3</:tab>
              </.tabs>
            </div>
          </div>
        </section>

        <%!-- Breadcrumb Section --%>
        <section :if={@active_tab in ["all", "navigation"]} id="breadcrumb-section">
          <h2 class="text-xl font-bold mb-4 border-b border-base-300 pb-2">Breadcrumb</h2>
          <p class="text-base-content/70 mb-4">
            Navigation trail showing the current page location.
          </p>

          <.breadcrumb>
            <:crumb navigate={~p"/"}>Home</:crumb>
            <:crumb>Documents</:crumb>
            <:crumb>Projects</:crumb>
            <:crumb>Current Page</:crumb>
          </.breadcrumb>
        </section>

        <%!-- Tooltip Section --%>
        <section :if={@active_tab in ["all", "feedback"]} id="tooltip-section">
          <h2 class="text-xl font-bold mb-4 border-b border-base-300 pb-2">Tooltip</h2>
          <p class="text-base-content/70 mb-4">
            Contextual hints that appear on hover.
          </p>

          <div class="flex gap-8 items-center justify-center py-8">
            <.tooltip content="Tooltip on top" position="top">
              <.button>Top</.button>
            </.tooltip>

            <.tooltip content="Tooltip on bottom" position="bottom">
              <.button>Bottom</.button>
            </.tooltip>

            <.tooltip content="Tooltip on left" position="left">
              <.button>Left</.button>
            </.tooltip>

            <.tooltip content="Tooltip on right" position="right">
              <.button>Right</.button>
            </.tooltip>
          </div>

          <div class="flex gap-4 items-center justify-center">
            <.tooltip content="Primary tooltip" variant="primary">
              <.badge variant="primary">Primary</.badge>
            </.tooltip>

            <.tooltip content="Success tooltip" variant="success">
              <.badge variant="success">Success</.badge>
            </.tooltip>

            <.tooltip content="Warning tooltip" variant="warning">
              <.badge variant="warning">Warning</.badge>
            </.tooltip>

            <.tooltip content="Error tooltip" variant="error">
              <.badge variant="error">Error</.badge>
            </.tooltip>
          </div>
        </section>
      </div>
    </Layouts.app>
    """
  end
end
