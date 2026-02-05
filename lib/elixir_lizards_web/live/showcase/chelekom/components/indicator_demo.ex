defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.IndicatorDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Indicator
  alias ElixirLizardsWeb.Components.Chelekom.Avatar

  def render(assigns) do
    ~H"""
    <div id="indicator-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Indicator</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Small visual indicators for status, notifications, and alerts
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="indicator-positions" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Basic Indicators</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-8">
              <div id="indicator-top-right" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator top_right />
              </div>

              <div id="indicator-top-left" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator top_left />
              </div>

              <div id="indicator-bottom-right" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator bottom_right />
              </div>

              <div id="indicator-bottom-left" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator bottom_left />
              </div>
            </div>
          </div>
        </div>

        <div id="indicator-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-8">
              <div id="indicator-color-primary" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator color="primary" top_right />
              </div>

              <div id="indicator-color-secondary" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator color="secondary" top_right />
              </div>

              <div id="indicator-color-success" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator color="success" top_right />
              </div>

              <div id="indicator-color-warning" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator color="warning" top_right />
              </div>

              <div id="indicator-color-danger" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator color="danger" top_right />
              </div>

              <div id="indicator-color-info" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator color="info" top_right />
              </div>
            </div>
          </div>
        </div>

        <div id="indicator-sizes" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Sizes</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-8 items-center">
              <div id="indicator-size-xs" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator size="extra_small" color="primary" top_right />
                <span class="block text-xs mt-2 text-center">Extra Small</span>
              </div>

              <div id="indicator-size-sm" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator size="small" color="primary" top_right />
                <span class="block text-xs mt-2 text-center">Small</span>
              </div>

              <div id="indicator-size-md" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator size="medium" color="primary" top_right />
                <span class="block text-xs mt-2 text-center">Medium</span>
              </div>

              <div id="indicator-size-lg" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator size="large" color="primary" top_right />
                <span class="block text-xs mt-2 text-center">Large</span>
              </div>
            </div>
          </div>
        </div>

        <div id="indicator-animated" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Ping Animation</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-8">
              <div id="indicator-ping-success" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator color="success" top_right pinging />
              </div>

              <div id="indicator-ping-danger" class="demo-item relative inline-block">
                <div class="w-12 h-12 bg-base-300 rounded-lg"></div>
                <Indicator.indicator color="danger" top_right pinging />
              </div>

              <div id="indicator-avatar" class="demo-item relative inline-block">
                <Avatar.avatar src="https://i.pravatar.cc/150?img=5" size="large" rounded="full" />
                <Indicator.indicator color="success" size="medium" bottom_right />
              </div>
            </div>
          </div>
        </div>

        <div id="indicator-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;div class="relative inline-block"&gt;
    &lt;Avatar.avatar src="/images/user.jpg" /&gt;
    &lt;Indicator.indicator color="success" size="medium" bottom_right /&gt;
    &lt;/div&gt;

    &lt;!-- With ping animation --&gt;
    &lt;div class="relative"&gt;
    &lt;button&gt;Notifications&lt;/button&gt;
    &lt;Indicator.indicator color="danger" top_right pinging /&gt;
    &lt;/div&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
