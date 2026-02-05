defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.MenuDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Menu

  def render(assigns) do
    # Simple flat menu items (no nested sub_items)
    menu_items = [
      %{
        id: "dashboard",
        navigate: "#",
        title: "Dashboard",
        size: "extra_small",
        color: "misc",
        variant: "unbordered",
        rounded: "large",
        class: "w-full",
        display: "flex",
        icon_class: "size-5",
        icon: "hero-home",
        active: true
      },
      %{
        id: "users",
        navigate: "#",
        title: "Users",
        size: "extra_small",
        color: "misc",
        variant: "unbordered",
        rounded: "large",
        class: "w-full",
        display: "flex",
        icon_class: "size-5",
        icon: "hero-users"
      },
      %{
        id: "settings",
        navigate: "#",
        title: "Settings",
        size: "extra_small",
        color: "misc",
        variant: "unbordered",
        rounded: "large",
        class: "w-full",
        display: "flex",
        icon_class: "size-5",
        icon: "hero-cog-6-tooth"
      },
      %{
        id: "reports",
        navigate: "#",
        title: "Reports",
        size: "extra_small",
        color: "misc",
        variant: "unbordered",
        rounded: "large",
        class: "w-full",
        display: "flex",
        icon_class: "size-5",
        icon: "hero-chart-bar"
      }
    ]

    assigns = assign(assigns, :menu_items, menu_items)

    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Menu</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Hierarchical menu structures with nested sub-menus and collapsible sections
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <!-- Data-driven Menu -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Data-driven Menu</h3>
          <p class="text-sm text-base-content/70">
            Menu built from a list of maps with icons and styling options
          </p>
          <div class="max-w-xs bg-base-200 rounded-lg p-2">
            <Menu.menu menu_items={@menu_items} space="small" padding="small" />
          </div>
        </div>
        
    <!-- Slot-based Menu -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Slot-based Menu</h3>
          <p class="text-sm text-base-content/70">Menu with manual slot content for full control</p>
          <div class="max-w-xs bg-base-200 rounded-lg p-2">
            <Menu.menu space="small" padding="small">
              <li>
                <a href="#" class="flex items-center gap-3 px-3 py-2 rounded-lg hover:bg-base-300">
                  <.icon name="hero-inbox" class="size-5" />
                  <span>Inbox</span>
                  <span class="ml-auto d-badge d-badge-primary d-badge-sm">12</span>
                </a>
              </li>
              <li>
                <a href="#" class="flex items-center gap-3 px-3 py-2 rounded-lg hover:bg-base-300">
                  <.icon name="hero-document-text" class="size-5" />
                  <span>Documents</span>
                </a>
              </li>
              <li>
                <a href="#" class="flex items-center gap-3 px-3 py-2 rounded-lg hover:bg-base-300">
                  <.icon name="hero-calendar" class="size-5" />
                  <span>Calendar</span>
                </a>
              </li>
              <li>
                <a
                  href="#"
                  class="flex items-center gap-3 px-3 py-2 rounded-lg hover:bg-base-300 text-error"
                >
                  <.icon name="hero-trash" class="size-5" />
                  <span>Trash</span>
                </a>
              </li>
            </Menu.menu>
          </div>
        </div>
        
    <!-- Spacing Options -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Spacing Options</h3>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div class="space-y-2">
              <p class="text-sm font-medium">Extra Small Space</p>
              <div class="bg-base-200 rounded-lg p-2">
                <Menu.menu space="extra_small" padding="extra_small">
                  <li><a href="#" class="block px-2 py-1 rounded hover:bg-base-300">Item 1</a></li>
                  <li><a href="#" class="block px-2 py-1 rounded hover:bg-base-300">Item 2</a></li>
                  <li><a href="#" class="block px-2 py-1 rounded hover:bg-base-300">Item 3</a></li>
                </Menu.menu>
              </div>
            </div>
            <div class="space-y-2">
              <p class="text-sm font-medium">Medium Space</p>
              <div class="bg-base-200 rounded-lg p-2">
                <Menu.menu space="medium" padding="medium">
                  <li><a href="#" class="block px-2 py-1 rounded hover:bg-base-300">Item 1</a></li>
                  <li><a href="#" class="block px-2 py-1 rounded hover:bg-base-300">Item 2</a></li>
                  <li><a href="#" class="block px-2 py-1 rounded hover:bg-base-300">Item 3</a></li>
                </Menu.menu>
              </div>
            </div>
            <div class="space-y-2">
              <p class="text-sm font-medium">Large Space</p>
              <div class="bg-base-200 rounded-lg p-2">
                <Menu.menu space="large" padding="large">
                  <li><a href="#" class="block px-2 py-1 rounded hover:bg-base-300">Item 1</a></li>
                  <li><a href="#" class="block px-2 py-1 rounded hover:bg-base-300">Item 2</a></li>
                  <li><a href="#" class="block px-2 py-1 rounded hover:bg-base-300">Item 3</a></li>
                </Menu.menu>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
