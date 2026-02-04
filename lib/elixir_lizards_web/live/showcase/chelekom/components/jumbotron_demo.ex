defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.JumbotronDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Jumbotron

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Jumbotron</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Large hero sections for showcasing important content
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Basic Jumbotron</h3>
          <Jumbotron.jumbotron padding="large">
            <div class="text-center py-8">
              <h1 class="text-4xl font-bold mb-4">Welcome to Our Platform</h1>
              <p class="text-lg mb-6 max-w-2xl mx-auto">
                Build amazing applications with our comprehensive component library.
                Get started today and transform your ideas into reality.
              </p>
              <div class="flex justify-center gap-4">
                <button class="btn btn-primary">Get Started</button>
                <button class="btn btn-outline">Learn More</button>
              </div>
            </div>
          </Jumbotron.jumbotron>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Color Variants</h3>
          <Jumbotron.jumbotron variant="default" color="primary" padding="medium">
            <div class="text-center py-6">
              <h2 class="text-2xl font-bold mb-2">Primary Jumbotron</h2>
              <p>A prominent section with primary color theme.</p>
            </div>
          </Jumbotron.jumbotron>

          <Jumbotron.jumbotron variant="default" color="secondary" padding="medium">
            <div class="text-center py-6">
              <h2 class="text-2xl font-bold mb-2">Secondary Jumbotron</h2>
              <p>A prominent section with secondary color theme.</p>
            </div>
          </Jumbotron.jumbotron>

          <Jumbotron.jumbotron variant="default" color="success" padding="medium">
            <div class="text-center py-6">
              <h2 class="text-2xl font-bold mb-2">Success Jumbotron</h2>
              <p>Perfect for success messages and celebrations.</p>
            </div>
          </Jumbotron.jumbotron>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">With Border</h3>
          <Jumbotron.jumbotron border_position="bottom" border_size="medium" padding="medium">
            <div class="text-center py-6">
              <h2 class="text-2xl font-bold mb-2">Bordered Jumbotron</h2>
              <p>Features a bottom border for visual separation.</p>
            </div>
          </Jumbotron.jumbotron>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Shadow Variant</h3>
          <Jumbotron.jumbotron variant="shadow" color="info" padding="large">
            <div class="text-center py-8">
              <h2 class="text-3xl font-bold mb-4">Elevated Design</h2>
              <p class="max-w-xl mx-auto">
                The shadow variant adds depth and prominence to your hero section,
                making it stand out from the rest of the page.
              </p>
            </div>
          </Jumbotron.jumbotron>
        </div>

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;Jumbotron.jumbotron variant="default" color="primary" padding="large"&gt;
    &lt;div class="text-center py-8"&gt;
    &lt;h1 class="text-4xl font-bold"&gt;Hero Title&lt;/h1&gt;
    &lt;p class="mt-4"&gt;Subtitle or description text&lt;/p&gt;
    &lt;button class="btn btn-primary mt-6"&gt;Call to Action&lt;/button&gt;
    &lt;/div&gt;
    &lt;/Jumbotron.jumbotron&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
