defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.CarouselDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Carousel

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Carousel</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Image carousel with navigation controls and indicators
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Indicators</h3>
          <Carousel.carousel id="carousel-demo-1" indicator={true}>
            <:slide
              image="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=1200&h=600&fit=crop"
              title="Mountain Landscape"
              description="Beautiful mountain scenery with snow-capped peaks"
              content_position="center"
            />
            <:slide
              image="https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=1200&h=600&fit=crop"
              title="Forest Path"
              description="A serene path through the forest"
              content_position="center"
            />
            <:slide
              image="https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?w=1200&h=600&fit=crop"
              title="Autumn Colors"
              description="Vibrant fall foliage in the woods"
              content_position="center"
            />
          </Carousel.carousel>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Autoplay</h3>
          <Carousel.carousel
            id="carousel-demo-2"
            indicator={true}
            autoplay={true}
            autoplay_interval={4000}
          >
            <:slide
              image="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1200&h=600&fit=crop"
              title="Beach Sunset"
              description="Golden sunset over the ocean"
              content_position="end"
            />
            <:slide
              image="https://images.unsplash.com/photo-1519681393784-d120267933ba?w=1200&h=600&fit=crop"
              title="Starry Night"
              description="Mountains under the stars"
              content_position="center"
            />
            <:slide
              image="https://images.unsplash.com/photo-1433086966358-54859d0ed716?w=1200&h=600&fit=crop"
              title="Waterfall"
              description="Majestic waterfall in nature"
              content_position="start"
            />
          </Carousel.carousel>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Without Controls</h3>
          <Carousel.carousel id="carousel-demo-3" control={false} indicator={true}>
            <:slide
              image="https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=1200&h=600&fit=crop"
              title="Foggy Valley"
              content_position="center"
            />
            <:slide
              image="https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=1200&h=600&fit=crop"
              title="Sunlit Forest"
              content_position="center"
            />
          </Carousel.carousel>
        </div>
      </div>
    </div>
    """
  end
end
