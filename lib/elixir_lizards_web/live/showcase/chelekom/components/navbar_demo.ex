defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.NavbarDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Navbar

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Navbar</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Customizable navigation bars with multiple variants, colors, and slot-based content
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <!-- Base Variant -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Base Variant</h3>
          <Navbar.navbar id="navbar-base" variant="base" color="natural" padding="small">
            <:start_content class="flex items-center gap-2">
              <.icon name="hero-cube" class="size-6" />
              <span class="font-bold">Brand</span>
            </:start_content>
            <:list><.link navigate="#">Home</.link></:list>
            <:list><.link navigate="#">About</.link></:list>
            <:list><.link navigate="#">Services</.link></:list>
            <:list><.link navigate="#">Contact</.link></:list>
            <:end_content>
              <button class="d-btn d-btn-sm d-btn-primary">Sign In</button>
            </:end_content>
          </Navbar.navbar>
        </div>
        
    <!-- Default Variant with Colors -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Default Variant - Colors</h3>
          <div class="space-y-4">
            <Navbar.navbar
              id="navbar-primary"
              variant="default"
              color="primary"
              padding="small"
              rounded="medium"
            >
              <:start_content class="flex items-center gap-2">
                <.icon name="hero-sparkles" class="size-6" />
                <span class="font-bold">Primary</span>
              </:start_content>
              <:list><.link navigate="#">Home</.link></:list>
              <:list><.link navigate="#">Products</.link></:list>
              <:list><.link navigate="#">Pricing</.link></:list>
            </Navbar.navbar>

            <Navbar.navbar
              id="navbar-secondary"
              variant="default"
              color="secondary"
              padding="small"
              rounded="medium"
            >
              <:start_content class="flex items-center gap-2">
                <.icon name="hero-star" class="size-6" />
                <span class="font-bold">Secondary</span>
              </:start_content>
              <:list><.link navigate="#">Home</.link></:list>
              <:list><.link navigate="#">Products</.link></:list>
              <:list><.link navigate="#">Pricing</.link></:list>
            </Navbar.navbar>

            <Navbar.navbar
              id="navbar-success"
              variant="default"
              color="success"
              padding="small"
              rounded="medium"
            >
              <:start_content class="flex items-center gap-2">
                <.icon name="hero-check-circle" class="size-6" />
                <span class="font-bold">Success</span>
              </:start_content>
              <:list><.link navigate="#">Home</.link></:list>
              <:list><.link navigate="#">Products</.link></:list>
              <:list><.link navigate="#">Pricing</.link></:list>
            </Navbar.navbar>
          </div>
        </div>
        
    <!-- Shadow Variant -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Shadow Variant</h3>
          <Navbar.navbar
            id="navbar-shadow"
            variant="shadow"
            color="info"
            padding="small"
            rounded="medium"
          >
            <:start_content class="flex items-center gap-2">
              <.icon name="hero-cloud" class="size-6" />
              <span class="font-bold">CloudApp</span>
            </:start_content>
            <:list><.link navigate="#">Dashboard</.link></:list>
            <:list><.link navigate="#">Storage</.link></:list>
            <:list><.link navigate="#">Settings</.link></:list>
            <:end_content class="flex items-center gap-2">
              <.icon name="hero-bell" class="size-5" />
              <.icon name="hero-user-circle" class="size-6" />
            </:end_content>
          </Navbar.navbar>
        </div>
        
    <!-- Bordered Variant -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Bordered Variant</h3>
          <Navbar.navbar
            id="navbar-bordered"
            variant="bordered"
            color="warning"
            padding="small"
            border="small"
            rounded="medium"
          >
            <:start_content class="flex items-center gap-2">
              <.icon name="hero-bolt" class="size-6" />
              <span class="font-bold">FastShip</span>
            </:start_content>
            <:list><.link navigate="#">Track</.link></:list>
            <:list><.link navigate="#">Ship</.link></:list>
            <:list><.link navigate="#">History</.link></:list>
            <:list><.link navigate="#">Support</.link></:list>
          </Navbar.navbar>
        </div>
        
    <!-- Gradient Variant -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Gradient Variant</h3>
          <Navbar.navbar
            id="navbar-gradient"
            variant="gradient"
            color="primary"
            padding="small"
            rounded="medium"
          >
            <:start_content class="flex items-center gap-2">
              <.icon name="hero-rocket-launch" class="size-6" />
              <span class="font-bold">LaunchPad</span>
            </:start_content>
            <:list><.link navigate="#">Features</.link></:list>
            <:list><.link navigate="#">Pricing</.link></:list>
            <:list><.link navigate="#">Blog</.link></:list>
            <:end_content>
              <button class="d-btn d-btn-sm d-btn-ghost">Get Started</button>
            </:end_content>
          </Navbar.navbar>
        </div>
        
    <!-- With Icons in List -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Navigation with Icons</h3>
          <Navbar.navbar
            id="navbar-icons"
            variant="default"
            color="dark"
            padding="small"
            rounded="medium"
          >
            <:start_content class="flex items-center gap-2">
              <span class="font-bold text-lg">Menu</span>
            </:start_content>
            <:list icon="hero-home" icon_class="size-4"><.link navigate="#">Home</.link></:list>
            <:list icon="hero-folder" icon_class="size-4"><.link navigate="#">Projects</.link></:list>
            <:list icon="hero-users" icon_class="size-4"><.link navigate="#">Team</.link></:list>
            <:list icon="hero-cog-6-tooth" icon_class="size-4">
              <.link navigate="#">Settings</.link>
            </:list>
          </Navbar.navbar>
        </div>
        
    <!-- Content Positioning -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Content Positioning</h3>
          <div class="space-y-4">
            <Navbar.navbar
              id="navbar-center"
              variant="bordered"
              color="natural"
              padding="small"
              content_position="center"
              rounded="medium"
            >
              <:list><.link navigate="#">Centered</.link></:list>
              <:list><.link navigate="#">Navigation</.link></:list>
              <:list><.link navigate="#">Items</.link></:list>
            </Navbar.navbar>

            <Navbar.navbar
              id="navbar-end"
              variant="bordered"
              color="natural"
              padding="small"
              content_position="end"
              rounded="medium"
            >
              <:list><.link navigate="#">Right</.link></:list>
              <:list><.link navigate="#">Aligned</.link></:list>
              <:list><.link navigate="#">Items</.link></:list>
            </Navbar.navbar>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
