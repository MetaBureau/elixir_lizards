defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.BannerDemo do
  use ElixirLizardsWeb, :live_component

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
            Note: Banners are fixed positioned. These examples show static versions for demo purposes.
          </p>
          <div class="demo-grid grid gap-4">
            <div
              id="banner-color-primary"
              class="demo-item relative p-4 rounded-lg bg-primary-light text-white"
            >
              <div class="demo-item-content flex gap-2 items-center justify-between">
                <span>Primary banner - Perfect for announcements</span>
              </div>
            </div>

            <div
              id="banner-color-success"
              class="demo-item relative p-4 rounded-lg bg-success-light text-white"
            >
              <div class="demo-item-content flex gap-2 items-center justify-between">
                <span>Success banner - Operation completed</span>
              </div>
            </div>

            <div
              id="banner-color-warning"
              class="demo-item relative p-4 rounded-lg bg-warning-light text-white"
            >
              <div class="demo-item-content flex gap-2 items-center justify-between">
                <span>Warning banner - Requires attention</span>
              </div>
            </div>

            <div
              id="banner-color-danger"
              class="demo-item relative p-4 rounded-lg bg-danger-light text-white"
            >
              <div class="demo-item-content flex gap-2 items-center justify-between">
                <span>Danger banner - Critical information</span>
              </div>
            </div>
          </div>
        </div>

        <div id="banner-variants" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Variant Styles</h3>
          <div class="demo-grid grid gap-4">
            <div
              id="banner-variant-default"
              class="demo-item relative p-4 rounded-lg bg-info-light text-white border-b-2 border-info-dark"
            >
              <div class="demo-item-content flex gap-2 items-center justify-between">
                <span>Default variant with border</span>
              </div>
            </div>

            <div
              id="banner-variant-outline"
              class="demo-item relative p-4 rounded-lg border-2 border-secondary-light text-secondary-light"
            >
              <div class="demo-item-content flex gap-2 items-center justify-between">
                <span>Outline variant</span>
              </div>
            </div>

            <div
              id="banner-variant-gradient"
              class="demo-item relative p-4 rounded-lg bg-gradient-to-br from-misc-light to-misc-dark text-white"
            >
              <div class="demo-item-content flex gap-2 items-center justify-between">
                <span>Gradient variant</span>
              </div>
            </div>
          </div>
        </div>

        <div id="banner-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;Banner.banner id="my-banner" color="primary" position="full"&gt;
    &lt;span&gt;Welcome to our new feature!&lt;/span&gt;
    &lt;/Banner.banner&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
