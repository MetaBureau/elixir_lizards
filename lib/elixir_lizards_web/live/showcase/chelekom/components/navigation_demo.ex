defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.NavigationDemo do
  @moduledoc """
  Navigation components demo: Breadcrumb, Dropdown, MegaMenu, Menu, Navbar, Pagination, Sidebar, Footer, ScrollArea
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{
    Breadcrumb,
    Button,
    Dropdown,
    Footer,
    MegaMenu,
    Pagination,
    ScrollArea,
    Sidebar
  }

  def render(assigns) do
    ~H"""
    <div class="space-y-12">
      <!-- Breadcrumb -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Breadcrumb</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Navigation trails showing the current page location
          </p>
        </div>

        <div class="space-y-4 flex flex-col items-center">
          <Breadcrumb.breadcrumb>
            <:item icon="hero-home" link="/">Home</:item>
            <:item link="/dev">Development</:item>
            <:item>Chelekom</:item>
          </Breadcrumb.breadcrumb>

          <Breadcrumb.breadcrumb color="primary" size="medium">
            <:item icon="hero-folder">Projects</:item>
            <:item icon="hero-document">Documentation</:item>
            <:item icon="hero-code-bracket">Components</:item>
          </Breadcrumb.breadcrumb>
        </div>
      </section>

      <!-- Dropdown -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Dropdown</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Expandable menus for actions and navigation options
          </p>
        </div>

        <div class="flex flex-wrap gap-6 justify-center">
          <Dropdown.dropdown id="nav-dropdown-1" position="bottom" clickable rounded="medium">
            <:trigger>
              <Button.button>
                Click Me <.icon name="hero-chevron-down" class="size-4 ml-1" />
              </Button.button>
            </:trigger>
            <:content>
              <div class="py-1 min-w-32">
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Dashboard</div>
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Settings</div>
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Profile</div>
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer text-error">Sign Out</div>
              </div>
            </:content>
          </Dropdown.dropdown>

          <Dropdown.dropdown id="nav-dropdown-2" position="bottom" clickable rounded="medium">
            <:trigger>
              <Button.button variant="outline">
                Options <.icon name="hero-chevron-down" class="size-4 ml-1" />
              </Button.button>
            </:trigger>
            <:content>
              <div class="py-1 min-w-32">
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Edit</div>
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Duplicate</div>
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Archive</div>
              </div>
            </:content>
          </Dropdown.dropdown>
        </div>
      </section>

      <!-- Mega Menu -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Mega Menu</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Multi-level navigation menus for complex site structures
          </p>
        </div>

        <div class="max-w-4xl mx-auto">
          <div class="relative">
            <MegaMenu.mega_menu id="nav-mega-menu" rounded="medium" padding="medium" clickable>
              <:trigger>
                <Button.button>
                  Open Mega Menu <.icon name="hero-chevron-down" class="size-4 ml-1" />
                </Button.button>
              </:trigger>

              <div class="bg-base-100 rounded-lg shadow-xl border border-base-300 p-6">
                <div class="grid md:grid-cols-3 gap-6">
                  <div>
                    <h3 class="font-semibold mb-3 text-primary">Products</h3>
                    <ul class="space-y-2">
                      <li><a href="#" class="hover:text-primary transition-colors">Analytics</a></li>
                      <li><a href="#" class="hover:text-primary transition-colors">Automation</a></li>
                      <li><a href="#" class="hover:text-primary transition-colors">Integrations</a></li>
                    </ul>
                  </div>
                  <div>
                    <h3 class="font-semibold mb-3 text-secondary">Resources</h3>
                    <ul class="space-y-2">
                      <li><a href="#" class="hover:text-secondary transition-colors">Documentation</a></li>
                      <li><a href="#" class="hover:text-secondary transition-colors">Guides</a></li>
                      <li><a href="#" class="hover:text-secondary transition-colors">API Reference</a></li>
                    </ul>
                  </div>
                  <div class="bg-base-200 rounded-lg p-4">
                    <h3 class="font-semibold mb-2">Featured</h3>
                    <p class="text-sm text-base-content/70 mb-3">Check out our latest updates.</p>
                    <Button.button size="small" variant="primary">Learn More</Button.button>
                  </div>
                </div>
              </div>
            </MegaMenu.mega_menu>
          </div>
        </div>
      </section>

      <!-- Pagination -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Pagination</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Navigate through pages of content
          </p>
        </div>

        <div class="space-y-6 flex flex-col items-center">
          <Pagination.pagination total={10} active={3} siblings={1} />
          <Pagination.pagination total={20} active={7} siblings={2} variant="outline" show_edges />
        </div>
      </section>

      <!-- Sidebar -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Sidebar</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Collapsible navigation panels for app layouts
          </p>
        </div>

        <div class="flex flex-wrap gap-4 justify-center">
          <Button.button phx-click={Sidebar.show_sidebar("nav-sidebar-left", "left")}>
            Open Left Sidebar
          </Button.button>
          <Button.button variant="outline" phx-click={Sidebar.show_sidebar("nav-sidebar-right", "right")}>
            Open Right Sidebar
          </Button.button>
        </div>

        <Sidebar.sidebar id="nav-sidebar-left" size="medium" position="start" hide_position="left" class="!-translate-x-full">
          <div class="p-4">
            <h3 class="font-semibold text-lg mb-4">Navigation</h3>
            <ul class="space-y-2">
              <li><a href="#" class="flex items-center gap-2 p-2 rounded hover:bg-base-200"><.icon name="hero-home" class="size-5" /> Dashboard</a></li>
              <li><a href="#" class="flex items-center gap-2 p-2 rounded hover:bg-base-200"><.icon name="hero-users" class="size-5" /> Users</a></li>
              <li><a href="#" class="flex items-center gap-2 p-2 rounded hover:bg-base-200"><.icon name="hero-cog-6-tooth" class="size-5" /> Settings</a></li>
            </ul>
          </div>
        </Sidebar.sidebar>

        <Sidebar.sidebar id="nav-sidebar-right" size="medium" position="end" hide_position="right" color="primary" class="!translate-x-full">
          <div class="p-4">
            <h3 class="font-semibold text-lg mb-4">Quick Actions</h3>
            <div class="space-y-3">
              <Button.button class="w-full" size="small">New Project</Button.button>
              <Button.button class="w-full" size="small" variant="outline">Import Data</Button.button>
            </div>
          </div>
        </Sidebar.sidebar>
      </section>

      <!-- Scroll Area -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Scroll Area</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Custom scrollable containers with styled scrollbars
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 max-w-4xl mx-auto">
          <div>
            <h3 class="text-lg font-semibold mb-3">Vertical Scroll</h3>
            <ScrollArea.scroll_area id="nav-scroll-1" height="h-48" padding="small" class="border border-base-300 rounded-lg">
              <div class="space-y-4">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <p>Ut enim ad minim veniam, quis nostrud exercitation.</p>
                <p>Duis aute irure dolor in reprehenderit in voluptate.</p>
                <p>Excepteur sint occaecat cupidatat non proident.</p>
                <p>Sed ut perspiciatis unde omnis iste natus error.</p>
                <p>Totam rem aperiam, eaque ipsa quae ab illo inventore.</p>
              </div>
            </ScrollArea.scroll_area>
          </div>

          <div>
            <h3 class="text-lg font-semibold mb-3">Content List</h3>
            <ScrollArea.scroll_area id="nav-scroll-2" height="h-48" padding="extra_small" class="border border-base-300 rounded-lg">
              <ul class="divide-y divide-base-300">
                <li :for={i <- 1..12} class="p-3 hover:bg-base-200 transition-colors">
                  <div class="flex items-center gap-3">
                    <div class="rounded-full bg-primary/10 p-2">
                      <.icon name="hero-document" class="size-4 text-primary" />
                    </div>
                    <div>
                      <div class="font-medium">Item {i}</div>
                      <div class="text-sm text-base-content/60">Description</div>
                    </div>
                  </div>
                </li>
              </ul>
            </ScrollArea.scroll_area>
          </div>
        </div>
      </section>

      <!-- Footer -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Footer</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Customizable page footers with sections and layouts
          </p>
        </div>

        <div class="max-w-4xl mx-auto">
          <Footer.footer color="natural" padding="medium" rounded="large">
            <Footer.footer_section class="grid grid-cols-1 md:grid-cols-3 gap-6" padding="medium">
              <div>
                <h4 class="font-semibold mb-3">Company</h4>
                <ul class="space-y-2 text-sm">
                  <li><a href="#" class="hover:underline">About Us</a></li>
                  <li><a href="#" class="hover:underline">Careers</a></li>
                </ul>
              </div>
              <div>
                <h4 class="font-semibold mb-3">Support</h4>
                <ul class="space-y-2 text-sm">
                  <li><a href="#" class="hover:underline">Help Center</a></li>
                  <li><a href="#" class="hover:underline">Contact Us</a></li>
                </ul>
              </div>
              <div>
                <h4 class="font-semibold mb-3">Legal</h4>
                <ul class="space-y-2 text-sm">
                  <li><a href="#" class="hover:underline">Privacy Policy</a></li>
                  <li><a href="#" class="hover:underline">Terms of Service</a></li>
                </ul>
              </div>
            </Footer.footer_section>
            <Footer.footer_section text_position="center" class="border-t border-base-content/10" padding="small">
              <p class="text-sm">&copy; 2024 Elixir Lizards. All rights reserved.</p>
            </Footer.footer_section>
          </Footer.footer>
        </div>
      </section>
    </div>
    """
  end
end
