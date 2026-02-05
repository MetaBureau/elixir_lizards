defmodule ElixirLizardsWeb.Showcase.DaisyUI.Pages.DemoIndexLive do
  @moduledoc """
  Index page for all demo pages showcasing different DaisyUI components and patterns.
  """
  use ElixirLizardsWeb, :live_view

  @demos [
    %{
      name: "Dashboard",
      path: "/demo/dashboard",
      description: "Stats, cards, tables, activity feeds, and quick actions",
      icon: "hero-chart-bar-square",
      color: "bg-primary/10 text-primary"
    },
    %{
      name: "Features",
      path: "/demo/features",
      description: "Hero sections, feature grids, testimonials, and CTAs",
      icon: "hero-sparkles",
      color: "bg-secondary/10 text-secondary"
    },
    %{
      name: "Pricing",
      path: "/demo/pricing",
      description: "Pricing cards, comparison tables, toggles, and FAQ accordions",
      icon: "hero-currency-dollar",
      color: "bg-success/10 text-success"
    },
    %{
      name: "Team",
      path: "/demo/team",
      description: "Avatars, member cards, department tabs, and social links",
      icon: "hero-user-group",
      color: "bg-info/10 text-info"
    },
    %{
      name: "Contact",
      path: "/demo/contact",
      description: "Forms, inputs, validation, and contact info cards",
      icon: "hero-envelope",
      color: "bg-warning/10 text-warning"
    }
  ]

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Demo Pages")
     |> assign(:demos, @demos)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb>Demo</:crumb>
      </.breadcrumb>

      <.header>
        Demo Pages
        <:subtitle>
          Explore sample pages showcasing DaisyUI components with Phoenix LiveView
        </:subtitle>
      </.header>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <.link
          :for={demo <- @demos}
          navigate={demo.path}
          class="card bg-base-100 card-border border-base-300 hover:border-primary hover:shadow-lg transition-all duration-300"
        >
          <div class="card-body">
            <div class="flex items-start gap-4">
              <div class={["rounded-xl p-3", demo.color]}>
                <.icon name={demo.icon} class="size-8" />
              </div>
              <div class="flex-1">
                <h2 class="card-title text-xl mb-2">{demo.name}</h2>
                <p class="text-base-content/70">{demo.description}</p>
              </div>
              <.icon name="hero-arrow-right" class="size-5 text-base-content/30" />
            </div>
          </div>
        </.link>
      </div>

      <%!-- Component Library Link --%>
      <div class="mt-8 p-6 bg-gradient-to-r from-primary/10 to-secondary/10 rounded-box">
        <div class="flex items-center justify-between">
          <div>
            <h3 class="font-semibold text-lg">Looking for individual components?</h3>
            <p class="text-base-content/70">
              Check out our component library with live previews and code examples.
            </p>
          </div>
          <.link href="/showcase" class="btn btn-primary">
            <.icon name="hero-rectangle-stack" class="size-5 mr-2" /> Component Library
          </.link>
        </div>
      </div>

      <%!-- Tech Stack Info --%>
      <div class="mt-8">
        <h3 class="text-lg font-semibold mb-4">Built With</h3>
        <div class="flex flex-wrap gap-2">
          <.badge variant="primary" size="lg">Phoenix 1.8</.badge>
          <.badge variant="secondary" size="lg">LiveView</.badge>
          <.badge variant="accent" size="lg">Ash Framework</.badge>
          <.badge variant="info" size="lg">DaisyUI</.badge>
          <.badge variant="success" size="lg">Tailwind CSS</.badge>
          <.badge variant="warning" size="lg">Elixir</.badge>
        </div>
      </div>
    </Layouts.app>
    """
  end
end
