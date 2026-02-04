defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.SpeedDialDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.SpeedDial

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Speed Dial</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Floating action button with expandable quick actions
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Interactive Demo</h3>
          <p class="text-sm text-base-content/60 mb-4">
            Note: Speed dial is a fixed-position component. Below are static examples showing the component structure.
          </p>

          <div class="relative h-64 bg-base-200 rounded-lg overflow-hidden">
            <div class="absolute bottom-4 right-4">
              <SpeedDial.speed_dial
                id="speed-dial-demo-1"
                icon="hero-plus"
                clickable
                action_position="bottom-end"
                class="!relative !bottom-0 !right-0"
              >
                <:item icon="hero-home" href="#" color="primary"></:item>
                <:item icon="hero-document" href="#" color="secondary"></:item>
                <:item icon="hero-cog-6-tooth" href="#" color="info"></:item>
              </SpeedDial.speed_dial>
            </div>
            <div class="flex items-center justify-center h-full text-base-content/40">
              <p>Click the button to expand actions</p>
            </div>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Color Variants</h3>
          <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div class="text-center">
              <div class="relative h-24 bg-base-200 rounded-lg flex items-center justify-center">
                <SpeedDial.speed_dial
                  id="speed-dial-primary"
                  icon="hero-plus"
                  color="primary"
                  class="!relative !bottom-0 !right-0 !position-[unset]"
                >
                </SpeedDial.speed_dial>
              </div>
              <span class="text-sm mt-2 block">Primary</span>
            </div>

            <div class="text-center">
              <div class="relative h-24 bg-base-200 rounded-lg flex items-center justify-center">
                <SpeedDial.speed_dial
                  id="speed-dial-success"
                  icon="hero-plus"
                  color="success"
                  class="!relative !bottom-0 !right-0 !position-[unset]"
                >
                </SpeedDial.speed_dial>
              </div>
              <span class="text-sm mt-2 block">Success</span>
            </div>

            <div class="text-center">
              <div class="relative h-24 bg-base-200 rounded-lg flex items-center justify-center">
                <SpeedDial.speed_dial
                  id="speed-dial-warning"
                  icon="hero-plus"
                  color="warning"
                  class="!relative !bottom-0 !right-0 !position-[unset]"
                >
                </SpeedDial.speed_dial>
              </div>
              <span class="text-sm mt-2 block">Warning</span>
            </div>

            <div class="text-center">
              <div class="relative h-24 bg-base-200 rounded-lg flex items-center justify-center">
                <SpeedDial.speed_dial
                  id="speed-dial-danger"
                  icon="hero-plus"
                  color="danger"
                  class="!relative !bottom-0 !right-0 !position-[unset]"
                >
                </SpeedDial.speed_dial>
              </div>
              <span class="text-sm mt-2 block">Danger</span>
            </div>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Sizes</h3>
          <div class="flex flex-wrap gap-8 items-center justify-center">
            <div class="text-center">
              <div class="relative h-20 w-20 bg-base-200 rounded-lg flex items-center justify-center">
                <SpeedDial.speed_dial
                  id="speed-dial-small"
                  icon="hero-plus"
                  size="small"
                  class="!relative !bottom-0 !right-0 !position-[unset]"
                >
                </SpeedDial.speed_dial>
              </div>
              <span class="text-sm mt-2 block">Small</span>
            </div>

            <div class="text-center">
              <div class="relative h-20 w-20 bg-base-200 rounded-lg flex items-center justify-center">
                <SpeedDial.speed_dial
                  id="speed-dial-medium"
                  icon="hero-plus"
                  size="medium"
                  class="!relative !bottom-0 !right-0 !position-[unset]"
                >
                </SpeedDial.speed_dial>
              </div>
              <span class="text-sm mt-2 block">Medium</span>
            </div>

            <div class="text-center">
              <div class="relative h-24 w-24 bg-base-200 rounded-lg flex items-center justify-center">
                <SpeedDial.speed_dial
                  id="speed-dial-large"
                  icon="hero-plus"
                  size="large"
                  class="!relative !bottom-0 !right-0 !position-[unset]"
                >
                </SpeedDial.speed_dial>
              </div>
              <span class="text-sm mt-2 block">Large</span>
            </div>
          </div>
        </div>

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;SpeedDial.speed_dial id="my-speed-dial" icon="hero-plus" clickable&gt;
    &lt;:item icon="hero-home" href="/" color="primary"&gt;&lt;/:item&gt;
    &lt;:item icon="hero-document" navigate="/docs" color="secondary"&gt;&lt;/:item&gt;
    &lt;:item icon="hero-cog-6-tooth" patch="/settings" color="info"&gt;&lt;/:item&gt;
    &lt;/SpeedDial.speed_dial&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
