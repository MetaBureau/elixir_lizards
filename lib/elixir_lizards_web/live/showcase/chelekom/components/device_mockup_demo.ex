defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.DeviceMockupDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.DeviceMockup

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Device Mockup</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Display content within realistic device frames
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">iPhone Mockup</h3>
          <div class="flex justify-center">
            <DeviceMockup.device_mockup
              type="iphone"
              image="https://picsum.photos/seed/iphone/375/812"
            />
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Android Mockup</h3>
          <div class="flex justify-center">
            <DeviceMockup.device_mockup
              type="android"
              image="https://picsum.photos/seed/android/360/740"
            />
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">iPad Mockup</h3>
          <div class="flex justify-center">
            <DeviceMockup.device_mockup type="ipad" image="https://picsum.photos/seed/ipad/768/1024" />
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Laptop Mockup</h3>
          <div class="flex justify-center">
            <DeviceMockup.device_mockup
              type="laptop"
              image="https://picsum.photos/seed/laptop/1280/800"
            />
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">With Custom Content</h3>
          <div class="flex justify-center">
            <DeviceMockup.device_mockup type="iphone" color="natural">
              <div class="bg-gradient-to-br from-primary-light to-secondary-light h-full flex flex-col items-center justify-center text-white p-4">
                <h4 class="text-lg font-bold">My App</h4>
                <p class="text-sm mt-2">Welcome Screen</p>
              </div>
            </DeviceMockup.device_mockup>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Color Variants</h3>
          <div class="flex flex-wrap justify-center gap-8">
            <div class="text-center">
              <DeviceMockup.device_mockup type="iphone" color="base">
                <div class="bg-base-100 h-full"></div>
              </DeviceMockup.device_mockup>
              <span class="text-sm mt-2 block">Base</span>
            </div>
            <div class="text-center">
              <DeviceMockup.device_mockup type="iphone" color="natural">
                <div class="bg-base-100 h-full"></div>
              </DeviceMockup.device_mockup>
              <span class="text-sm mt-2 block">Natural</span>
            </div>
            <div class="text-center">
              <DeviceMockup.device_mockup type="iphone" color="primary">
                <div class="bg-base-100 h-full"></div>
              </DeviceMockup.device_mockup>
              <span class="text-sm mt-2 block">Primary</span>
            </div>
          </div>
        </div>

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;DeviceMockup.device_mockup type="iphone" image="/images/screenshot.png" /&gt;

    &lt;DeviceMockup.device_mockup type="laptop" color="natural"&gt;
    &lt;div class="h-full bg-white"&gt;Custom content&lt;/div&gt;
    &lt;/DeviceMockup.device_mockup&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
