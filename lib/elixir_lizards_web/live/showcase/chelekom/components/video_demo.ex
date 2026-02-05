defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.VideoDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Video

  def render(assigns) do
    ~H"""
    <div id="video-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Video</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          HTML5 video player with customizable controls and captions
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="video-basic" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Basic Video</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <Video.video ratio="video" rounded="medium" controls>
              <:source
                src="https://www.w3schools.com/html/mov_bbb.mp4"
                type="video/mp4"
              />
            </Video.video>
          </div>
        </div>

        <div id="video-thumbnail" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Video with Thumbnail</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <Video.video
              ratio="video"
              rounded="large"
              thumbnail="https://picsum.photos/seed/video/800/450"
              controls
            >
              <:source
                src="https://www.w3schools.com/html/movie.mp4"
                type="video/mp4"
              />
            </Video.video>
          </div>
        </div>

        <div id="video-ratios" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Different Aspect Ratios</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-grid grid grid-cols-1 md:grid-cols-2 gap-4">
              <div id="video-ratio-16-9" class="demo-item">
                <p class="demo-label text-sm text-base-content/60 mb-2">16:9 (video)</p>
                <Video.video ratio="video" rounded="medium" width="full" controls>
                  <:source
                    src="https://www.w3schools.com/html/mov_bbb.mp4"
                    type="video/mp4"
                  />
                </Video.video>
              </div>
              <div id="video-ratio-4-3" class="demo-item">
                <p class="demo-label text-sm text-base-content/60 mb-2">4:3</p>
                <Video.video ratio="4:3" rounded="medium" width="full" controls>
                  <:source
                    src="https://www.w3schools.com/html/mov_bbb.mp4"
                    type="video/mp4"
                  />
                </Video.video>
              </div>
            </div>
          </div>
        </div>

        <div id="video-sizes" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Size Variants</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items space-y-4">
              <div id="video-size-small" class="demo-item">
                <p class="demo-label text-sm text-base-content/60 mb-2">Small width</p>
                <Video.video ratio="video" rounded="medium" width="small" controls>
                  <:source
                    src="https://www.w3schools.com/html/mov_bbb.mp4"
                    type="video/mp4"
                  />
                </Video.video>
              </div>
              <div id="video-size-medium" class="demo-item">
                <p class="demo-label text-sm text-base-content/60 mb-2">Medium width</p>
                <Video.video ratio="video" rounded="medium" width="medium" controls>
                  <:source
                    src="https://www.w3schools.com/html/mov_bbb.mp4"
                    type="video/mp4"
                  />
                </Video.video>
              </div>
            </div>
          </div>
        </div>

        <div id="video-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;Video.video ratio="video" rounded="medium" thumbnail="/images/poster.jpg" controls&gt;
    &lt;:source src="/videos/demo.mp4" type="video/mp4" /&gt;
    &lt;:source src="/videos/demo.webm" type="video/webm" /&gt;
    &lt;:track label="English" kind="captions" srclang="en" src="/captions/en.vtt" default /&gt;
    &lt;/Video.video&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
