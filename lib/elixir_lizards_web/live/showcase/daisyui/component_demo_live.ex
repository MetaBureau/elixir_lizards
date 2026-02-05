defmodule ElixirLizardsWeb.Showcase.DaisyUI.ComponentDemoLive do
  @moduledoc """
  Index page for the component library demo.
  """
  use ElixirLizardsWeb, :live_view

  @components [
    %{
      name: "Modal",
      path: "/showcase/daisyui/modal",
      description: "Dialog overlays for confirmations and forms",
      icon: "hero-window"
    },
    %{
      name: "Card",
      path: "/showcase/daisyui/card",
      description: "Flexible content containers",
      icon: "hero-rectangle-group"
    },
    %{
      name: "Badge",
      path: "/showcase/daisyui/badge",
      description: "Status indicators and labels",
      icon: "hero-tag"
    },
    %{
      name: "Dropdown",
      path: "/showcase/daisyui/dropdown",
      description: "Contextual menus and actions",
      icon: "hero-chevron-down"
    },
    %{
      name: "Avatar",
      path: "/showcase/daisyui/avatar",
      description: "User profile images with fallbacks",
      icon: "hero-user-circle"
    },
    %{
      name: "Stat",
      path: "/showcase/daisyui/stat",
      description: "Dashboard statistics display",
      icon: "hero-chart-bar"
    },
    %{
      name: "Empty State",
      path: "/showcase/daisyui/empty-state",
      description: "Placeholders for empty collections",
      icon: "hero-folder-open"
    },
    %{
      name: "Tabs",
      path: "/showcase/daisyui/tabs",
      description: "Navigation between views",
      icon: "hero-rectangle-stack"
    },
    %{
      name: "Breadcrumb",
      path: "/showcase/daisyui/breadcrumb",
      description: "Navigation trail",
      icon: "hero-chevron-right"
    },
    %{
      name: "Tooltip",
      path: "/showcase/daisyui/tooltip",
      description: "Contextual hints on hover",
      icon: "hero-chat-bubble-bottom-center-text"
    }
  ]

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Component Library")
     |> assign(:components, @components)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/showcase">Components</:crumb>
        <:crumb>DaisyUI</:crumb>
      </.breadcrumb>

      <.header>
        DaisyUI Components
        <:subtitle>Tailwind CSS components built for ElixirLizards</:subtitle>
        <:actions>
          <.button navigate="/showcase/chelekom">Mishka Chelekom</.button>
        </:actions>
      </.header>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <.link
          :for={component <- @components}
          navigate={component.path}
          class="d-card bg-base-100 d-card-border border-base-300 hover:border-primary transition-colors"
        >
          <div class="d-card-body">
            <div class="flex items-center gap-3">
              <div class="rounded-lg bg-primary/10 p-2">
                <.icon name={component.icon} class="size-6 text-primary" />
              </div>
              <h2 class="d-card-title text-lg">{component.name}</h2>
            </div>
            <p class="text-base-content/70 text-sm mt-2">{component.description}</p>
          </div>
        </.link>
      </div>
    </Layouts.app>
    """
  end
end
