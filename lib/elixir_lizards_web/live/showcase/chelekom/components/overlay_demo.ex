defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.OverlayDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Overlay

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Overlay</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Background overlays for modals, loading screens, and layered content
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Color Variants</h3>
          <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div class="relative h-32 rounded-lg overflow-hidden border border-base-300">
              <img
                src="https://picsum.photos/seed/ov1/200/150"
                alt="Background"
                class="w-full h-full object-cover"
              />
              <Overlay.overlay color="dark" class="[--overlay-opacity:0.5]" z_index="z-10" />
              <span class="absolute inset-0 z-20 flex items-center justify-center text-white text-sm font-medium">
                Dark
              </span>
            </div>

            <div class="relative h-32 rounded-lg overflow-hidden border border-base-300">
              <img
                src="https://picsum.photos/seed/ov2/200/150"
                alt="Background"
                class="w-full h-full object-cover"
              />
              <Overlay.overlay color="primary" class="[--overlay-opacity:0.6]" z_index="z-10" />
              <span class="absolute inset-0 z-20 flex items-center justify-center text-white text-sm font-medium">
                Primary
              </span>
            </div>

            <div class="relative h-32 rounded-lg overflow-hidden border border-base-300">
              <img
                src="https://picsum.photos/seed/ov3/200/150"
                alt="Background"
                class="w-full h-full object-cover"
              />
              <Overlay.overlay color="success" class="[--overlay-opacity:0.6]" z_index="z-10" />
              <span class="absolute inset-0 z-20 flex items-center justify-center text-white text-sm font-medium">
                Success
              </span>
            </div>

            <div class="relative h-32 rounded-lg overflow-hidden border border-base-300">
              <img
                src="https://picsum.photos/seed/ov4/200/150"
                alt="Background"
                class="w-full h-full object-cover"
              />
              <Overlay.overlay color="danger" class="[--overlay-opacity:0.6]" z_index="z-10" />
              <span class="absolute inset-0 z-20 flex items-center justify-center text-white text-sm font-medium">
                Danger
              </span>
            </div>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">With Backdrop Blur</h3>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div class="relative h-40 rounded-lg overflow-hidden border border-base-300">
              <img
                src="https://picsum.photos/seed/blur1/300/200"
                alt="Background"
                class="w-full h-full object-cover"
              />
              <Overlay.overlay
                color="white"
                backdrop="small"
                class="[--overlay-opacity:0.3]"
                z_index="z-10"
              />
              <span class="absolute inset-0 z-20 flex items-center justify-center text-black text-sm font-medium">
                Small Blur
              </span>
            </div>

            <div class="relative h-40 rounded-lg overflow-hidden border border-base-300">
              <img
                src="https://picsum.photos/seed/blur2/300/200"
                alt="Background"
                class="w-full h-full object-cover"
              />
              <Overlay.overlay
                color="white"
                backdrop="medium"
                class="[--overlay-opacity:0.3]"
                z_index="z-10"
              />
              <span class="absolute inset-0 z-20 flex items-center justify-center text-black text-sm font-medium">
                Medium Blur
              </span>
            </div>

            <div class="relative h-40 rounded-lg overflow-hidden border border-base-300">
              <img
                src="https://picsum.photos/seed/blur3/300/200"
                alt="Background"
                class="w-full h-full object-cover"
              />
              <Overlay.overlay
                color="white"
                backdrop="large"
                class="[--overlay-opacity:0.3]"
                z_index="z-10"
              />
              <span class="absolute inset-0 z-20 flex items-center justify-center text-black text-sm font-medium">
                Large Blur
              </span>
            </div>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Loading State Example</h3>
          <div class="relative h-48 rounded-lg overflow-hidden border border-base-300">
            <div class="p-4">
              <p class="text-base-content">This content is behind the loading overlay.</p>
              <p class="text-base-content/60 mt-2">
                The overlay can contain loading indicators or messages.
              </p>
            </div>
            <Overlay.overlay
              color="dark"
              backdrop="small"
              class="[--overlay-opacity:0.7]"
              z_index="z-10"
            >
              <div class="flex flex-col justify-center items-center gap-3 h-full">
                <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-white"></div>
                <span class="text-white font-medium">Loading...</span>
              </div>
            </Overlay.overlay>
          </div>
        </div>

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;div class="relative"&gt;
    &lt;!-- Content behind overlay --&gt;
    &lt;Overlay.overlay color="dark" backdrop="medium" class="[--overlay-opacity:0.7]"&gt;
    &lt;div class="flex items-center justify-center h-full"&gt;
      Loading...
    &lt;/div&gt;
    &lt;/Overlay.overlay&gt;
    &lt;/div&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
