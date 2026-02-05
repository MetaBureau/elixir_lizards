defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.BannerDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Banner

  def render(assigns) do
    ~H"""
    <div id="banner-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Banner</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Fixed position banners for announcements and notifications
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="banner-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <p class="text-sm text-base-content/60 mb-4">
            Note: Banners are normally fixed positioned. These examples override positioning for demo purposes.
          </p>
          <div class="demo-grid grid gap-4">
            <Banner.banner
              id="banner-color-primary"
              variant="default"
              color="primary"
              hide_dismiss={true}
              class="!static"
            >
              <span>Primary banner - Perfect for announcements</span>
            </Banner.banner>

            <Banner.banner
              id="banner-color-success"
              variant="default"
              color="success"
              hide_dismiss={true}
              class="!static"
            >
              <span>Success banner - Operation completed</span>
            </Banner.banner>

            <Banner.banner
              id="banner-color-warning"
              variant="default"
              color="warning"
              hide_dismiss={true}
              class="!static"
            >
              <span>Warning banner - Requires attention</span>
            </Banner.banner>

            <Banner.banner
              id="banner-color-danger"
              variant="default"
              color="danger"
              hide_dismiss={true}
              class="!static"
            >
              <span>Danger banner - Critical information</span>
            </Banner.banner>
          </div>
        </div>

        <div id="banner-variants" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Variant Styles</h3>
          <div class="demo-grid grid gap-4">
            <Banner.banner
              id="banner-variant-bordered"
              variant="bordered"
              color="info"
              hide_dismiss={true}
              class="!static"
            >
              <span>Bordered variant</span>
            </Banner.banner>

            <Banner.banner
              id="banner-variant-outline"
              variant="outline"
              color="secondary"
              hide_dismiss={true}
              class="!static"
            >
              <span>Outline variant</span>
            </Banner.banner>

            <Banner.banner
              id="banner-variant-gradient"
              variant="gradient"
              color="misc"
              hide_dismiss={true}
              class="!static"
            >
              <span>Gradient variant</span>
            </Banner.banner>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
