defmodule ElixirLizardsWeb.ChelekomDemoLive do
  use ElixirLizardsWeb, :live_view

  # Import CoreComponents for icons
  import ElixirLizardsWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="container mx-auto p-8 space-y-12">
      <.header>
        Mishka Chelekom Components
        <:subtitle>Modern, customizable UI components for Phoenix LiveView</:subtitle>
      </.header>
      
    <!-- Alert Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Alert Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Contextual feedback messages with multiple variants and styles
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          <ElixirLizardsWeb.Components.Alert.alert kind={:info} title="Info">
            This is an informational message.
          </ElixirLizardsWeb.Components.Alert.alert>

          <ElixirLizardsWeb.Components.Alert.alert kind={:success} title="Success" variant="outline">
            Action completed successfully.
          </ElixirLizardsWeb.Components.Alert.alert>

          <ElixirLizardsWeb.Components.Alert.alert kind={:warning} title="Warning" variant="bordered">
            Please review your input.
          </ElixirLizardsWeb.Components.Alert.alert>

          <ElixirLizardsWeb.Components.Alert.alert kind={:error} title="Error" variant="shadow">
            Something went wrong.
          </ElixirLizardsWeb.Components.Alert.alert>
        </div>
      </section>
      
    <!-- Badge Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Badge Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Small indicators with variants, sizes, and optional icons
          </p>
        </div>

        <div class="flex flex-wrap gap-3 justify-center">
          <ElixirLizardsWeb.Components.Badge.badge>Default</ElixirLizardsWeb.Components.Badge.badge>
          <ElixirLizardsWeb.Components.Badge.badge variant="primary">
            Primary
          </ElixirLizardsWeb.Components.Badge.badge>
          <ElixirLizardsWeb.Components.Badge.badge variant="secondary">
            Secondary
          </ElixirLizardsWeb.Components.Badge.badge>
          <ElixirLizardsWeb.Components.Badge.badge color="success">
            Success
          </ElixirLizardsWeb.Components.Badge.badge>
          <ElixirLizardsWeb.Components.Badge.badge color="warning">
            Warning
          </ElixirLizardsWeb.Components.Badge.badge>
          <ElixirLizardsWeb.Components.Badge.badge color="error">
            Error
          </ElixirLizardsWeb.Components.Badge.badge>
          <ElixirLizardsWeb.Components.Badge.badge variant="outline">
            Outline
          </ElixirLizardsWeb.Components.Badge.badge>
        </div>
      </section>
      
    <!-- Button Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Button Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Interactive buttons with variants, sizes, and states
          </p>
        </div>

        <div class="space-y-4">
          <!-- Button Variants -->
          <div>
            <h3 class="text-lg font-semibold mb-3">Variants</h3>
            <div class="flex flex-wrap gap-3 justify-center">
              <ElixirLizardsWeb.Components.Button.button>
                Default
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button variant="primary">
                Primary
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button variant="outline">
                Outline
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button variant="ghost">
                Ghost
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button variant="link">
                Link
              </ElixirLizardsWeb.Components.Button.button>
            </div>
          </div>
          
    <!-- Button Colors -->
          <div>
            <h3 class="text-lg font-semibold mb-3">Colors</h3>
            <div class="flex flex-wrap gap-3 justify-center">
              <ElixirLizardsWeb.Components.Button.button color="success">
                Success
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button color="warning">
                Warning
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button color="error">
                Error
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button color="info">
                Info
              </ElixirLizardsWeb.Components.Button.button>
            </div>
          </div>
          
    <!-- Button Sizes -->
          <div>
            <h3 class="text-lg font-semibold mb-3">Sizes</h3>
            <div class="flex flex-wrap gap-3 justify-center items-center">
              <ElixirLizardsWeb.Components.Button.button size="extra_small">
                XS
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button size="small">
                SM
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button size="medium">
                MD
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button size="large">
                LG
              </ElixirLizardsWeb.Components.Button.button>
              <ElixirLizardsWeb.Components.Button.button size="extra_large">
                XL
              </ElixirLizardsWeb.Components.Button.button>
            </div>
          </div>
        </div>
      </section>
      
    <!-- Flash Group -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Flash Group</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Toast notifications for system messages and user feedback
          </p>
        </div>

        <div class="flex justify-center">
          <ElixirLizardsWeb.Components.Alert.flash_group flash={
            %{
              "info" => "Welcome to Mishka Chelekom components!",
              "success" => "Components loaded successfully",
              "error" => "Error message example"
            }
          } />
        </div>
      </section>
      
    <!-- Installation Summary -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Installation Complete!</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Mishka Chelekom components are now ready to use
          </p>
        </div>

        <div class="card bg-base-100 card-border border-base-300">
          <div class="card-body text-center">
            <div class="space-y-4">
              <div class="flex items-center gap-3 justify-center">
                <.icon name="hero-check-circle" class="size-6 text-success" />
                <span class="font-semibold">Components Generated</span>
              </div>

              <div class="flex items-center gap-3 justify-center">
                <.icon name="hero-swatch" class="size-6 text-primary" />
                <span class="font-semibold">Styles Imported</span>
              </div>

              <div class="flex items-center gap-3 justify-center">
                <.icon name="hero-sparkles" class="size-6 text-warning" />
                <span class="font-semibold">Ready to Use</span>
              </div>
            </div>

            <div class="mt-6 p-4 bg-base-200 rounded-lg">
              <p class="text-sm font-mono">
                Access this showcase at: <code>/dev/chelekom</code>
              </p>
            </div>
          </div>
        </div>
      </section>
    </div>
    """
  end
end
