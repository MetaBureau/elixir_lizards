defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.GalleryDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Gallery

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Gallery</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Customizable image gallery with grid and masonry layouts
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Default Grid Layout</h3>
          <Gallery.gallery cols="three" gap="small">
            <Gallery.gallery_media
              src="https://picsum.photos/seed/g1/400/300"
              alt="Gallery image 1"
              rounded="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/g2/400/300"
              alt="Gallery image 2"
              rounded="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/g3/400/300"
              alt="Gallery image 3"
              rounded="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/g4/400/300"
              alt="Gallery image 4"
              rounded="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/g5/400/300"
              alt="Gallery image 5"
              rounded="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/g6/400/300"
              alt="Gallery image 6"
              rounded="medium"
            />
          </Gallery.gallery>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Masonry Layout</h3>
          <Gallery.gallery type="masonry" cols="three" gap="small">
            <Gallery.gallery_media
              src="https://picsum.photos/seed/m1/400/500"
              alt="Masonry image 1"
              rounded="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/m2/400/300"
              alt="Masonry image 2"
              rounded="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/m3/400/400"
              alt="Masonry image 3"
              rounded="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/m4/400/350"
              alt="Masonry image 4"
              rounded="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/m5/400/450"
              alt="Masonry image 5"
              rounded="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/m6/400/280"
              alt="Masonry image 6"
              rounded="medium"
            />
          </Gallery.gallery>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">With Hover Animation</h3>
          <Gallery.gallery cols="four" gap="small" animation="scale-up" animation_size="small">
            <Gallery.gallery_media
              src="https://picsum.photos/seed/a1/300/300"
              alt="Animated image 1"
              rounded="large"
              shadow="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/a2/300/300"
              alt="Animated image 2"
              rounded="large"
              shadow="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/a3/300/300"
              alt="Animated image 3"
              rounded="large"
              shadow="medium"
            />
            <Gallery.gallery_media
              src="https://picsum.photos/seed/a4/300/300"
              alt="Animated image 4"
              rounded="large"
              shadow="medium"
            />
          </Gallery.gallery>
        </div>

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;Gallery.gallery cols="three" gap="medium" animation="scale-up"&gt;
    &lt;Gallery.gallery_media src="/images/photo.jpg" alt="Photo" rounded="medium" /&gt;
    &lt;/Gallery.gallery&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
