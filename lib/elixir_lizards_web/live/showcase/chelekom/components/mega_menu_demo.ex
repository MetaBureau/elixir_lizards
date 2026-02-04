defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.MegaMenuDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Button, MegaMenu}

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Mega Menu</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Multi-level navigation menus for complex site structures
        </p>
      </div>

      <div class="max-w-4xl mx-auto">
        <div class="relative">
          <MegaMenu.mega_menu id="chelekom-mega-menu" rounded="medium" padding="medium" clickable>
            <:trigger>
              <Button.button variant="default" color="primary">
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
                  <Button.button variant="default" color="primary" size="small">Learn More</Button.button>
                </div>
              </div>
            </div>
          </MegaMenu.mega_menu>
        </div>
      </div>
    </div>
    """
  end
end
