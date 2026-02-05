defmodule ElixirLizardsWeb.Showcase.Chelekom.ComponentDemoLive do
  @moduledoc """
  Mishka Chelekom component library showcase.
  Components are organized into category modules.
  """
  use ElixirLizardsWeb, :live_view

  alias ElixirLizardsWeb.Showcase.Chelekom.Categories.{
    General,
    Navigation,
    Feedback,
    Overlays,
    Media,
    Forms
  }

  @categories [
    %{name: "general", label: "General", module: General},
    %{name: "navigation", label: "Navigation", module: Navigation},
    %{name: "feedback", label: "Feedback", module: Feedback},
    %{name: "overlays", label: "Overlays", module: Overlays},
    %{name: "media", label: "Media", module: Media},
    %{name: "forms", label: "Forms", module: Forms}
  ]

  @impl true
  def mount(_params, _session, socket) do
    all_components =
      @categories
      |> Enum.flat_map(fn cat -> cat.module.components() end)

    {:ok,
     socket
     |> assign(:page_title, "Mishka Chelekom Components")
     |> assign(:categories, @categories)
     |> assign(:all_components, all_components)
     |> assign(:active_category, "all")}
  end

  @impl true
  def handle_event("select_category", %{"category" => category}, socket) do
    {:noreply, assign(socket, :active_category, category)}
  end

  defp get_category_module(categories, name) do
    Enum.find(categories, fn c -> c.name == name end)
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/showcase">Components</:crumb>
        <:crumb>Chelekom</:crumb>
      </.breadcrumb>

      <.header>
        Mishka Chelekom Components
        <:subtitle>Modern, customizable UI components for Phoenix LiveView</:subtitle>
        <:actions>
          <.button navigate="/showcase/daisyui">DaisyUI Components</.button>
        </:actions>
      </.header>
      
    <!-- Category Filter -->
      <div class="flex flex-wrap gap-2 justify-center my-8">
        <button
          phx-click="select_category"
          phx-value-category="all"
          class={[
            "btn btn-sm",
            @active_category == "all" && "btn-primary",
            @active_category != "all" && "btn-ghost"
          ]}
        >
          All
        </button>
        <button
          :for={category <- @categories}
          phx-click="select_category"
          phx-value-category={category.name}
          class={[
            "btn btn-sm",
            @active_category == category.name && "btn-primary",
            @active_category != category.name && "btn-ghost"
          ]}
        >
          {category.label}
        </button>
      </div>

      <div class="space-y-16">
        <%= if @active_category == "all" do %>
          <.live_component
            :for={category <- @categories}
            module={category.module}
            id={"category-#{category.name}"}
          />
        <% else %>
          <% category = get_category_module(@categories, @active_category) %>
          <.live_component
            :if={category}
            module={category.module}
            id={"category-#{category.name}"}
          />
        <% end %>
        
    <!-- Installation Summary -->
        <section class="space-y-6">
          <div class="text-center">
            <h2 class="text-3xl font-bold mb-2">{length(@all_components)} Components Installed</h2>
            <p class="text-base-content/70 max-w-2xl mx-auto">
              Mishka Chelekom components are ready to use in your application
            </p>
          </div>

          <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-2 max-w-4xl mx-auto text-sm">
            <div
              :for={component <- @all_components}
              class="flex items-center gap-2 p-2 rounded bg-base-200"
            >
              <.icon name="hero-check" class="size-4 text-success" />
              <span>{component.name}</span>
            </div>
          </div>

          <div class="text-center mt-6">
            <p class="text-sm text-base-content/70">
              Access this showcase at:
              <code class="bg-base-200 px-2 py-1 rounded">/showcase/chelekom</code>
            </p>
          </div>
        </section>
      </div>
    </Layouts.app>
    """
  end
end
