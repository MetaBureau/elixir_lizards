defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.DeviceMockupDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.DeviceMockup

  def render(assigns) do
    ~H"""
    <div id="device-mockup-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Device Mockup</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Display content within realistic device frames
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="device-mockup-iphone" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">iPhone Mockup</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item flex justify-center">
              <DeviceMockup.device_mockup
                type="iphone"
                image="https://picsum.photos/seed/iphone/375/812"
              />
            </div>
          </div>
        </div>

        <div id="device-mockup-android" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Android Mockup</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item flex justify-center">
              <DeviceMockup.device_mockup
                type="android"
                image="https://picsum.photos/seed/android/360/740"
              />
            </div>
          </div>
        </div>

        <div id="device-mockup-ipad" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">iPad Mockup</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item flex justify-center">
              <DeviceMockup.device_mockup
                type="ipad"
                image="https://picsum.photos/seed/ipad/768/1024"
              />
            </div>
          </div>
        </div>

        <div id="device-mockup-laptop" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Laptop Mockup</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item flex justify-center">
              <DeviceMockup.device_mockup
                type="laptop"
                image="https://picsum.photos/seed/laptop/1280/800"
              />
            </div>
          </div>
        </div>

        <div id="device-mockup-custom" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Custom Content</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-item flex justify-center">
              <DeviceMockup.device_mockup type="iphone" color="natural">
                <div class="bg-gradient-to-br from-primary-light to-secondary-light h-full flex flex-col items-center justify-center text-white p-4">
                  <h4 class="text-lg font-bold">My App</h4>
                  <p class="text-sm mt-2">Welcome Screen</p>
                </div>
              </DeviceMockup.device_mockup>
            </div>
          </div>
        </div>

        <div id="device-mockup-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap justify-center gap-8">
              <div id="device-mockup-color-base" class="demo-item text-center">
                <DeviceMockup.device_mockup type="iphone" color="base">
                  <div class="bg-base-100 h-full"></div>
                </DeviceMockup.device_mockup>
                <span class="demo-label text-sm mt-2 block">Base</span>
              </div>
              <div id="device-mockup-color-natural" class="demo-item text-center">
                <DeviceMockup.device_mockup type="iphone" color="natural">
                  <div class="bg-base-100 h-full"></div>
                </DeviceMockup.device_mockup>
                <span class="demo-label text-sm mt-2 block">Natural</span>
              </div>
              <div id="device-mockup-color-primary" class="demo-item text-center">
                <DeviceMockup.device_mockup type="iphone" color="primary">
                  <div class="bg-base-100 h-full"></div>
                </DeviceMockup.device_mockup>
                <span class="demo-label text-sm mt-2 block">Primary</span>
              </div>
            </div>
          </div>
        </div>

        <div id="device-mockup-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;DeviceMockup.device_mockup type="iphone" image="/images/screenshot.png" /&gt;

    &lt;DeviceMockup.device_mockup type="laptop" color="natural"&gt;
    &lt;div class="h-full bg-white"&gt;Custom content&lt;/div&gt;
    &lt;/DeviceMockup.device_mockup&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
