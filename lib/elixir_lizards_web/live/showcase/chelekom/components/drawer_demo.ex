defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.DrawerDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Button, Drawer}

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Drawer</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Sliding panels for navigation and additional content
        </p>
      </div>

      <div class="flex flex-wrap gap-4 justify-center">
        <Button.button phx-click={Drawer.show_drawer("chelekom-drawer-left", "left")}>
          Open Left Drawer
        </Button.button>
        <Button.button variant="outline" phx-click={Drawer.show_drawer("chelekom-drawer-right", "right")}>
          Open Right Drawer
        </Button.button>
      </div>

      <Drawer.drawer id="chelekom-drawer-left" title="Left Drawer" position="left">
        <p class="mb-4">This drawer slides in from the left side of the screen.</p>
        <p class="text-sm text-base-content/70">Click outside or the X button to close.</p>
      </Drawer.drawer>

      <Drawer.drawer id="chelekom-drawer-right" title="Right Drawer" position="right">
        <p class="mb-4">This drawer slides in from the right side of the screen.</p>
        <p class="text-sm text-base-content/70">Great for settings panels or navigation menus.</p>
      </Drawer.drawer>
    </div>
    """
  end
end
