defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.SidebarDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Button, Sidebar}

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Sidebar</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Collapsible navigation panels for app layouts
        </p>
      </div>

      <div class="flex flex-wrap gap-4 justify-center">
        <Button.button
          variant="default"
          color="primary"
          phx-click={Sidebar.show_sidebar("chelekom-sidebar-left", "left")}
        >
          Open Left Sidebar
        </Button.button>
        <Button.button
          variant="outline"
          color="primary"
          phx-click={Sidebar.show_sidebar("chelekom-sidebar-right", "right")}
        >
          Open Right Sidebar
        </Button.button>
      </div>

      <Sidebar.sidebar
        id="chelekom-sidebar-left"
        size="medium"
        position="start"
        hide_position="left"
        class="!-translate-x-full"
      >
        <div class="p-4">
          <h3 class="font-semibold text-lg mb-4">Navigation</h3>
          <ul class="space-y-2">
            <li>
              <a href="#" class="flex items-center gap-2 p-2 rounded hover:bg-base-200">
                <.icon name="hero-home" class="size-5" /> Dashboard
              </a>
            </li>
            <li>
              <a href="#" class="flex items-center gap-2 p-2 rounded hover:bg-base-200">
                <.icon name="hero-users" class="size-5" /> Users
              </a>
            </li>
            <li>
              <a href="#" class="flex items-center gap-2 p-2 rounded hover:bg-base-200">
                <.icon name="hero-cog-6-tooth" class="size-5" /> Settings
              </a>
            </li>
          </ul>
        </div>
      </Sidebar.sidebar>

      <Sidebar.sidebar
        id="chelekom-sidebar-right"
        size="medium"
        position="end"
        hide_position="right"
        color="primary"
        class="!translate-x-full"
      >
        <div class="p-4">
          <h3 class="font-semibold text-lg mb-4">Quick Actions</h3>
          <div class="space-y-3">
            <Button.button variant="default" color="primary" class="w-full" size="small">
              New Project
            </Button.button>
            <Button.button variant="outline" color="primary" class="w-full" size="small">
              Import Data
            </Button.button>
          </div>
        </div>
      </Sidebar.sidebar>
    </div>
    """
  end
end
