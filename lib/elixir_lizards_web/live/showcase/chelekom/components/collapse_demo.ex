defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.CollapseDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Collapse

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Collapse</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Collapsible content sections with smooth animations for expandable UI elements
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <!-- Basic Collapse -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Basic Collapse</h3>
          <Collapse.collapse id="basic-collapse">
            <:trigger>
              <button class="px-4 py-2 bg-base-200 hover:bg-base-300 rounded-lg w-full text-left flex items-center justify-between">
                <span>Click to toggle content</span>
                <.icon name="hero-chevron-down" class="size-5" />
              </button>
            </:trigger>
            <div class="p-4 bg-base-100 border border-base-300 rounded-lg mt-2">
              <p>
                This content can be toggled on and off. The collapse component provides smooth animations for showing and hiding content.
              </p>
            </div>
          </Collapse.collapse>
        </div>
        
    <!-- Initially Open -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Initially Open</h3>
          <Collapse.collapse id="open-collapse" open={true}>
            <:trigger>
              <button class="px-4 py-2 bg-primary text-primary-content rounded-lg w-full text-left flex items-center justify-between">
                <span>Settings Panel (Initially Open)</span>
                <.icon name="hero-cog-6-tooth" class="size-5" />
              </button>
            </:trigger>
            <div class="p-4 bg-base-100 border border-base-300 rounded-lg mt-2 space-y-2">
              <p class="font-medium">User Preferences</p>
              <ul class="list-disc list-inside text-sm text-base-content/70">
                <li>Theme: Dark Mode</li>
                <li>Language: English</li>
                <li>Notifications: Enabled</li>
              </ul>
            </div>
          </Collapse.collapse>
        </div>
        
    <!-- Custom Duration -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Custom Animation Duration</h3>
          <Collapse.collapse id="slow-collapse" duration={500}>
            <:trigger>
              <button class="px-4 py-2 bg-secondary text-secondary-content rounded-lg w-full text-left flex items-center justify-between">
                <span>Slow Animation (500ms)</span>
                <.icon name="hero-clock" class="size-5" />
              </button>
            </:trigger>
            <div class="p-4 bg-base-100 border border-base-300 rounded-lg mt-2">
              <p>
                This collapse has a slower animation duration of 500ms instead of the default 200ms.
              </p>
            </div>
          </Collapse.collapse>
        </div>
        
    <!-- Multiple Collapses -->
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">FAQ Style</h3>
          <div class="space-y-2">
            <Collapse.collapse id="faq-1">
              <:trigger>
                <button class="px-4 py-3 bg-base-200 hover:bg-base-300 rounded-lg w-full text-left flex items-center justify-between">
                  <span class="font-medium">What is Mishka Chelekom?</span>
                  <.icon name="hero-plus" class="size-5" />
                </button>
              </:trigger>
              <div class="px-4 py-3 text-base-content/70">
                Mishka Chelekom is a zero-configuration UI component library for Phoenix LiveView, built with Tailwind CSS.
              </div>
            </Collapse.collapse>

            <Collapse.collapse id="faq-2">
              <:trigger>
                <button class="px-4 py-3 bg-base-200 hover:bg-base-300 rounded-lg w-full text-left flex items-center justify-between">
                  <span class="font-medium">How do I install components?</span>
                  <.icon name="hero-plus" class="size-5" />
                </button>
              </:trigger>
              <div class="px-4 py-3 text-base-content/70">
                Use the mix task:
                <code class="bg-base-300 px-1 rounded">
                  mix mishka.ui.gen.component component_name
                </code>
              </div>
            </Collapse.collapse>

            <Collapse.collapse id="faq-3">
              <:trigger>
                <button class="px-4 py-3 bg-base-200 hover:bg-base-300 rounded-lg w-full text-left flex items-center justify-between">
                  <span class="font-medium">Are components customizable?</span>
                  <.icon name="hero-plus" class="size-5" />
                </button>
              </:trigger>
              <div class="px-4 py-3 text-base-content/70">
                Yes! Components are generated directly into your project, giving you full control over customization.
              </div>
            </Collapse.collapse>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
