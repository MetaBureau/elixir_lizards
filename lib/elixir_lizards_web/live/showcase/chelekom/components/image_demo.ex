defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ImageDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Image

  @sample_image "https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop"
  @sample_portrait "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200&h=200&fit=crop"

  def render(assigns) do
    assigns =
      assigns
      |> assign(:sample_image, @sample_image)
      |> assign(:sample_portrait, @sample_portrait)

    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Image</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Enhanced image component with border radius, shadows, filters, and loading options
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <!-- Basic Image -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Basic Image</h3>
          <div class="flex justify-center">
            <Image.image
              src={@sample_image}
              alt="Mountain landscape"
              width={400}
              height={300}
            />
          </div>
        </div>
        
    <!-- Border Radius -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Border Radius</h3>
          <div class="flex flex-wrap gap-4 items-center justify-center">
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_portrait}
                alt="Portrait"
                width={100}
                height={100}
                rounded="extra_small"
              />
              <p class="text-xs">extra_small</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_portrait}
                alt="Portrait"
                width={100}
                height={100}
                rounded="small"
              />
              <p class="text-xs">small</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_portrait}
                alt="Portrait"
                width={100}
                height={100}
                rounded="medium"
              />
              <p class="text-xs">medium</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_portrait}
                alt="Portrait"
                width={100}
                height={100}
                rounded="large"
              />
              <p class="text-xs">large</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_portrait}
                alt="Portrait"
                width={100}
                height={100}
                rounded="extra_large"
              />
              <p class="text-xs">extra_large</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_portrait}
                alt="Portrait"
                width={100}
                height={100}
                rounded="full"
              />
              <p class="text-xs">full</p>
            </div>
          </div>
        </div>
        
    <!-- Shadows -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Shadows</h3>
          <div class="flex flex-wrap gap-6 items-center justify-center">
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Landscape"
                width={150}
                height={100}
                rounded="medium"
                shadow="extra_small"
              />
              <p class="text-xs">extra_small</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Landscape"
                width={150}
                height={100}
                rounded="medium"
                shadow="small"
              />
              <p class="text-xs">small</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Landscape"
                width={150}
                height={100}
                rounded="medium"
                shadow="medium"
              />
              <p class="text-xs">medium</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Landscape"
                width={150}
                height={100}
                rounded="medium"
                shadow="large"
              />
              <p class="text-xs">large</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Landscape"
                width={150}
                height={100}
                rounded="medium"
                shadow="extra_large"
              />
              <p class="text-xs">extra_large</p>
            </div>
          </div>
        </div>
        
    <!-- Filters -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Filters</h3>
          <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Grayscale"
                width={150}
                height={100}
                rounded="medium"
                filter="grayscale"
              />
              <p class="text-xs">grayscale</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Sepia"
                width={150}
                height={100}
                rounded="medium"
                filter="sepia"
              />
              <p class="text-xs">sepia</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Invert"
                width={150}
                height={100}
                rounded="medium"
                filter="invert"
              />
              <p class="text-xs">invert</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Blur"
                width={150}
                height={100}
                rounded="medium"
                filter="blur"
                filter_size="small"
              />
              <p class="text-xs">blur (small)</p>
            </div>
          </div>
        </div>
        
    <!-- Filter Sizes -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Blur Filter Sizes</h3>
          <div class="flex flex-wrap gap-4 items-center justify-center">
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Blur extra_small"
                width={120}
                height={80}
                rounded="medium"
                filter="blur"
                filter_size="extra_small"
              />
              <p class="text-xs">extra_small</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Blur small"
                width={120}
                height={80}
                rounded="medium"
                filter="blur"
                filter_size="small"
              />
              <p class="text-xs">small</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Blur medium"
                width={120}
                height={80}
                rounded="medium"
                filter="blur"
                filter_size="medium"
              />
              <p class="text-xs">medium</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Blur large"
                width={120}
                height={80}
                rounded="medium"
                filter="blur"
                filter_size="large"
              />
              <p class="text-xs">large</p>
            </div>
          </div>
        </div>
        
    <!-- Loading Behavior -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Loading Behavior</h3>
          <div class="flex flex-wrap gap-6 items-center justify-center">
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Eager loading"
                width={200}
                height={150}
                rounded="medium"
                shadow="medium"
                loading="eager"
              />
              <p class="text-xs">loading="eager" (default)</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Lazy loading"
                width={200}
                height={150}
                rounded="medium"
                shadow="medium"
                loading="lazy"
              />
              <p class="text-xs">loading="lazy"</p>
            </div>
          </div>
        </div>
        
    <!-- Combined Styles -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Combined Styles</h3>
          <div class="flex flex-wrap gap-6 items-center justify-center">
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_portrait}
                alt="Avatar style"
                width={120}
                height={120}
                rounded="full"
                shadow="large"
                class="ring-4 ring-primary"
              />
              <p class="text-xs">Avatar with ring</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Card image"
                width={200}
                height={150}
                rounded="large"
                shadow="extra_large"
              />
              <p class="text-xs">Card image style</p>
            </div>
            <div class="text-center space-y-2">
              <Image.image
                src={@sample_image}
                alt="Vintage style"
                width={200}
                height={150}
                rounded="medium"
                shadow="medium"
                filter="sepia"
              />
              <p class="text-xs">Vintage effect</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
