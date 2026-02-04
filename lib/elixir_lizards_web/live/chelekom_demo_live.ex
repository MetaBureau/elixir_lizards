defmodule ElixirLizardsWeb.ChelekomDemoLive do
  use ElixirLizardsWeb, :live_view

  # Import CoreComponents for icons
  import ElixirLizardsWeb.CoreComponents

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/dev/components">Components</:crumb>
        <:crumb>Chelekom</:crumb>
      </.breadcrumb>

      <.header>
        Mishka Chelekom Components
        <:subtitle>Modern, customizable UI components for Phoenix LiveView</:subtitle>
        <:actions>
          <.button navigate="/dev/components/daisyui">DaisyUI Components</.button>
        </:actions>
      </.header>

      <div class="space-y-12">
      
    <!-- Alert Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Alert Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Contextual feedback messages with multiple variants and styles
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          <ElixirLizardsWeb.Components.Chelekom.Alert.alert kind={:info} title="Info">
            This is an informational message.
          </ElixirLizardsWeb.Components.Chelekom.Alert.alert>

          <ElixirLizardsWeb.Components.Chelekom.Alert.alert kind={:success} title="Success" variant="outline">
            Action completed successfully.
          </ElixirLizardsWeb.Components.Chelekom.Alert.alert>

          <ElixirLizardsWeb.Components.Chelekom.Alert.alert kind={:warning} title="Warning" variant="bordered">
            Please review your input.
          </ElixirLizardsWeb.Components.Chelekom.Alert.alert>

          <ElixirLizardsWeb.Components.Chelekom.Alert.alert kind={:error} title="Error" variant="shadow">
            Something went wrong.
          </ElixirLizardsWeb.Components.Chelekom.Alert.alert>
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
          <ElixirLizardsWeb.Components.Chelekom.Badge.badge>Default</ElixirLizardsWeb.Components.Chelekom.Badge.badge>
          <ElixirLizardsWeb.Components.Chelekom.Badge.badge variant="primary">
            Primary
          </ElixirLizardsWeb.Components.Chelekom.Badge.badge>
          <ElixirLizardsWeb.Components.Chelekom.Badge.badge variant="secondary">
            Secondary
          </ElixirLizardsWeb.Components.Chelekom.Badge.badge>
          <ElixirLizardsWeb.Components.Chelekom.Badge.badge color="success">
            Success
          </ElixirLizardsWeb.Components.Chelekom.Badge.badge>
          <ElixirLizardsWeb.Components.Chelekom.Badge.badge color="warning">
            Warning
          </ElixirLizardsWeb.Components.Chelekom.Badge.badge>
          <ElixirLizardsWeb.Components.Chelekom.Badge.badge color="error">
            Error
          </ElixirLizardsWeb.Components.Chelekom.Badge.badge>
          <ElixirLizardsWeb.Components.Chelekom.Badge.badge variant="outline">
            Outline
          </ElixirLizardsWeb.Components.Chelekom.Badge.badge>
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
              <ElixirLizardsWeb.Components.Chelekom.Button.button>
                Default
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button variant="primary">
                Primary
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button variant="outline">
                Outline
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button variant="ghost">
                Ghost
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button variant="link">
                Link
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
            </div>
          </div>
          
    <!-- Button Colors -->
          <div>
            <h3 class="text-lg font-semibold mb-3">Colors</h3>
            <div class="flex flex-wrap gap-3 justify-center">
              <ElixirLizardsWeb.Components.Chelekom.Button.button color="success">
                Success
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button color="warning">
                Warning
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button color="error">
                Error
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button color="info">
                Info
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
            </div>
          </div>
          
    <!-- Button Sizes -->
          <div>
            <h3 class="text-lg font-semibold mb-3">Sizes</h3>
            <div class="flex flex-wrap gap-3 justify-center items-center">
              <ElixirLizardsWeb.Components.Chelekom.Button.button size="extra_small">
                XS
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button size="small">
                SM
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button size="medium">
                MD
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button size="large">
                LG
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button size="extra_large">
                XL
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
            </div>
          </div>
        </div>
      </section>
      
    <!-- Card Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Card Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Flexible content containers with titles, media, content, and footers
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <!-- Basic Card -->
          <ElixirLizardsWeb.Components.Chelekom.Card.card padding="medium" rounded="large">
            <ElixirLizardsWeb.Components.Chelekom.Card.card_title title="Basic Card" icon="hero-document-text" />
            <ElixirLizardsWeb.Components.Chelekom.Card.card_content>
              A simple card with title, icon, and content section.
            </ElixirLizardsWeb.Components.Chelekom.Card.card_content>
          </ElixirLizardsWeb.Components.Chelekom.Card.card>

          <!-- Card with Footer -->
          <ElixirLizardsWeb.Components.Chelekom.Card.card padding="medium" rounded="large">
            <ElixirLizardsWeb.Components.Chelekom.Card.card_title title="With Footer" icon="hero-chat-bubble-left" />
            <ElixirLizardsWeb.Components.Chelekom.Card.card_content>
              Cards can include footer sections for actions.
            </ElixirLizardsWeb.Components.Chelekom.Card.card_content>
            <ElixirLizardsWeb.Components.Chelekom.Card.card_footer class="flex gap-2">
              <ElixirLizardsWeb.Components.Chelekom.Button.button size="small">Action</ElixirLizardsWeb.Components.Chelekom.Button.button>
              <ElixirLizardsWeb.Components.Chelekom.Button.button size="small" variant="outline">Cancel</ElixirLizardsWeb.Components.Chelekom.Button.button>
            </ElixirLizardsWeb.Components.Chelekom.Card.card_footer>
          </ElixirLizardsWeb.Components.Chelekom.Card.card>

          <!-- Colored Card -->
          <ElixirLizardsWeb.Components.Chelekom.Card.card variant="default" color="primary" padding="medium" rounded="large">
            <ElixirLizardsWeb.Components.Chelekom.Card.card_title title="Primary Color" icon="hero-star" />
            <ElixirLizardsWeb.Components.Chelekom.Card.card_content>
              Cards support multiple color variants for visual hierarchy.
            </ElixirLizardsWeb.Components.Chelekom.Card.card_content>
          </ElixirLizardsWeb.Components.Chelekom.Card.card>

          <!-- Outline Card -->
          <ElixirLizardsWeb.Components.Chelekom.Card.card variant="outline" color="success" padding="medium" rounded="large">
            <ElixirLizardsWeb.Components.Chelekom.Card.card_title title="Outline Variant" icon="hero-check-circle" />
            <ElixirLizardsWeb.Components.Chelekom.Card.card_content>
              Outline style with success color theme.
            </ElixirLizardsWeb.Components.Chelekom.Card.card_content>
          </ElixirLizardsWeb.Components.Chelekom.Card.card>

          <!-- Shadow Card -->
          <ElixirLizardsWeb.Components.Chelekom.Card.card variant="shadow" color="info" padding="medium" rounded="large">
            <ElixirLizardsWeb.Components.Chelekom.Card.card_title title="Shadow Variant" icon="hero-sparkles" />
            <ElixirLizardsWeb.Components.Chelekom.Card.card_content>
              Shadow variant adds depth with colored shadows.
            </ElixirLizardsWeb.Components.Chelekom.Card.card_content>
          </ElixirLizardsWeb.Components.Chelekom.Card.card>

          <!-- Gradient Card -->
          <ElixirLizardsWeb.Components.Chelekom.Card.card variant="gradient" color="secondary" padding="medium" rounded="large">
            <ElixirLizardsWeb.Components.Chelekom.Card.card_title title="Gradient" icon="hero-paint-brush" />
            <ElixirLizardsWeb.Components.Chelekom.Card.card_content>
              Gradient backgrounds for eye-catching designs.
            </ElixirLizardsWeb.Components.Chelekom.Card.card_content>
          </ElixirLizardsWeb.Components.Chelekom.Card.card>
        </div>
      </section>

    <!-- Avatar Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Avatar Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            User profile images with various sizes, shapes, and styles
          </p>
        </div>

        <div class="flex flex-wrap gap-4 justify-center items-end">
          <ElixirLizardsWeb.Components.Chelekom.Avatar.avatar size="extra_small" rounded="full" color="primary">
            <:icon name="hero-user" />
          </ElixirLizardsWeb.Components.Chelekom.Avatar.avatar>
          <ElixirLizardsWeb.Components.Chelekom.Avatar.avatar size="small" rounded="full" color="secondary">
            <:icon name="hero-user" />
          </ElixirLizardsWeb.Components.Chelekom.Avatar.avatar>
          <ElixirLizardsWeb.Components.Chelekom.Avatar.avatar size="medium" rounded="full" color="success">
            <:icon name="hero-user" />
          </ElixirLizardsWeb.Components.Chelekom.Avatar.avatar>
          <ElixirLizardsWeb.Components.Chelekom.Avatar.avatar size="large" rounded="full" color="warning">
            <:icon name="hero-user" />
          </ElixirLizardsWeb.Components.Chelekom.Avatar.avatar>
          <ElixirLizardsWeb.Components.Chelekom.Avatar.avatar size="extra_large" rounded="full" color="info">
            <:icon name="hero-user" />
          </ElixirLizardsWeb.Components.Chelekom.Avatar.avatar>
          <ElixirLizardsWeb.Components.Chelekom.Avatar.avatar size="medium" rounded="medium" color="silver">
            <:icon name="hero-user" />
          </ElixirLizardsWeb.Components.Chelekom.Avatar.avatar>
        </div>
      </section>

    <!-- Progress Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Progress Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Visual indicators for task completion and loading states
          </p>
        </div>

        <div class="space-y-4 max-w-xl mx-auto">
          <ElixirLizardsWeb.Components.Chelekom.Progress.progress value={25} color="primary" size="small" />
          <ElixirLizardsWeb.Components.Chelekom.Progress.progress value={50} color="secondary" size="medium" />
          <ElixirLizardsWeb.Components.Chelekom.Progress.progress value={75} color="success" size="large" />
          <ElixirLizardsWeb.Components.Chelekom.Progress.progress value={90} color="warning" size="extra_large" />
        </div>
      </section>

    <!-- Spinner Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Spinner Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Loading indicators with multiple animation styles
          </p>
        </div>

        <div class="space-y-6">
          <div>
            <h3 class="text-lg font-semibold mb-3 text-center">Default Spinner</h3>
            <div class="flex flex-wrap gap-6 justify-center items-center">
              <ElixirLizardsWeb.Components.Chelekom.Spinner.spinner size="extra_small" color="primary" />
              <ElixirLizardsWeb.Components.Chelekom.Spinner.spinner size="small" color="secondary" />
              <ElixirLizardsWeb.Components.Chelekom.Spinner.spinner size="medium" color="success" />
              <ElixirLizardsWeb.Components.Chelekom.Spinner.spinner size="large" color="warning" />
            </div>
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-3 text-center">Animation Types</h3>
            <div class="flex flex-wrap gap-8 justify-center items-center">
              <div class="text-center">
                <ElixirLizardsWeb.Components.Chelekom.Spinner.spinner type="default" size="large" color="primary" />
                <p class="text-sm mt-2">Default</p>
              </div>
              <div class="text-center">
                <ElixirLizardsWeb.Components.Chelekom.Spinner.spinner type="dots" size="large" color="secondary" />
                <p class="text-sm mt-2">Dots</p>
              </div>
              <div class="text-center">
                <ElixirLizardsWeb.Components.Chelekom.Spinner.spinner type="bars" size="large" color="success" />
                <p class="text-sm mt-2">Bars</p>
              </div>
              <div class="text-center">
                <ElixirLizardsWeb.Components.Chelekom.Spinner.spinner type="pinging" size="large" color="warning" />
                <p class="text-sm mt-2">Pinging</p>
              </div>
            </div>
          </div>
        </div>
      </section>

    <!-- Tabs Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Tabs Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Organize content into switchable panels
          </p>
        </div>

        <div class="max-w-2xl mx-auto">
          <ElixirLizardsWeb.Components.Chelekom.Tabs.tabs id="demo-tabs" color="primary" variant="pills" padding="small">
            <:tab icon="hero-home" active>Home</:tab>
            <:tab icon="hero-user">Profile</:tab>
            <:tab icon="hero-cog-6-tooth">Settings</:tab>

            <:panel>
              <div class="p-4">
                <h3 class="font-semibold mb-2">Welcome Home</h3>
                <p>This is the home tab content. Tabs help organize related content into separate views.</p>
              </div>
            </:panel>
            <:panel>
              <div class="p-4">
                <h3 class="font-semibold mb-2">User Profile</h3>
                <p>View and edit your profile information here.</p>
              </div>
            </:panel>
            <:panel>
              <div class="p-4">
                <h3 class="font-semibold mb-2">Settings</h3>
                <p>Customize your application preferences and configurations.</p>
              </div>
            </:panel>
          </ElixirLizardsWeb.Components.Chelekom.Tabs.tabs>
        </div>
      </section>

    <!-- Accordion Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Accordion Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Collapsible content sections for FAQs and expandable information
          </p>
        </div>

        <div class="max-w-2xl mx-auto">
          <ElixirLizardsWeb.Components.Chelekom.Accordion.accordion id="demo-accordion" color="natural" rounded="medium">
            <:item id="faq-1" title="What is Mishka Chelekom?" icon="hero-question-mark-circle" open>
              Mishka Chelekom is a zero-configuration UI component library for Phoenix LiveView,
              providing beautiful, customizable components out of the box.
            </:item>
            <:item id="faq-2" title="How do I install components?" icon="hero-arrow-down-tray">
              Use the mix task: <code>mix mishka.ui.gen.component component_name</code>
              to generate any component you need.
            </:item>
            <:item id="faq-3" title="Are components customizable?" icon="hero-paint-brush">
              Yes! Every component supports variants, colors, sizes, and custom CSS classes
              for complete design flexibility.
            </:item>
          </ElixirLizardsWeb.Components.Chelekom.Accordion.accordion>
        </div>
      </section>

    <!-- Tooltip Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Tooltip Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Contextual information on hover for enhanced UX
          </p>
        </div>

        <div class="flex flex-wrap gap-6 justify-center">
          <ElixirLizardsWeb.Components.Chelekom.Tooltip.tooltip position="top" color="natural">
            <:trigger>
              <ElixirLizardsWeb.Components.Chelekom.Button.button variant="outline">Top Tooltip</ElixirLizardsWeb.Components.Chelekom.Button.button>
            </:trigger>
            <:content>Tooltip on top</:content>
          </ElixirLizardsWeb.Components.Chelekom.Tooltip.tooltip>

          <ElixirLizardsWeb.Components.Chelekom.Tooltip.tooltip position="bottom" color="primary">
            <:trigger>
              <ElixirLizardsWeb.Components.Chelekom.Button.button variant="outline">Bottom Tooltip</ElixirLizardsWeb.Components.Chelekom.Button.button>
            </:trigger>
            <:content>Tooltip on bottom</:content>
          </ElixirLizardsWeb.Components.Chelekom.Tooltip.tooltip>

          <ElixirLizardsWeb.Components.Chelekom.Tooltip.tooltip position="left" color="success">
            <:trigger>
              <ElixirLizardsWeb.Components.Chelekom.Button.button variant="outline">Left Tooltip</ElixirLizardsWeb.Components.Chelekom.Button.button>
            </:trigger>
            <:content>Tooltip on left</:content>
          </ElixirLizardsWeb.Components.Chelekom.Tooltip.tooltip>

          <ElixirLizardsWeb.Components.Chelekom.Tooltip.tooltip position="right" color="warning">
            <:trigger>
              <ElixirLizardsWeb.Components.Chelekom.Button.button variant="outline">Right Tooltip</ElixirLizardsWeb.Components.Chelekom.Button.button>
            </:trigger>
            <:content>Tooltip on right</:content>
          </ElixirLizardsWeb.Components.Chelekom.Tooltip.tooltip>
        </div>
      </section>

    <!-- Table Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Table Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Structured data display with headers, rows, and styling options
          </p>
        </div>

        <div class="max-w-4xl mx-auto">
          <ElixirLizardsWeb.Components.Chelekom.Table.table rounded="medium" color="natural">
            <:header>Name</:header>
            <:header>Role</:header>
            <:header>Status</:header>
            <:header>Actions</:header>

            <ElixirLizardsWeb.Components.Chelekom.Table.tr>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>Alice Johnson</ElixirLizardsWeb.Components.Chelekom.Table.td>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>Developer</ElixirLizardsWeb.Components.Chelekom.Table.td>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>
                <ElixirLizardsWeb.Components.Chelekom.Badge.badge color="success">Active</ElixirLizardsWeb.Components.Chelekom.Badge.badge>
              </ElixirLizardsWeb.Components.Chelekom.Table.td>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>
                <ElixirLizardsWeb.Components.Chelekom.Button.button size="extra_small" variant="ghost">Edit</ElixirLizardsWeb.Components.Chelekom.Button.button>
              </ElixirLizardsWeb.Components.Chelekom.Table.td>
            </ElixirLizardsWeb.Components.Chelekom.Table.tr>

            <ElixirLizardsWeb.Components.Chelekom.Table.tr>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>Bob Smith</ElixirLizardsWeb.Components.Chelekom.Table.td>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>Designer</ElixirLizardsWeb.Components.Chelekom.Table.td>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>
                <ElixirLizardsWeb.Components.Chelekom.Badge.badge color="warning">Away</ElixirLizardsWeb.Components.Chelekom.Badge.badge>
              </ElixirLizardsWeb.Components.Chelekom.Table.td>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>
                <ElixirLizardsWeb.Components.Chelekom.Button.button size="extra_small" variant="ghost">Edit</ElixirLizardsWeb.Components.Chelekom.Button.button>
              </ElixirLizardsWeb.Components.Chelekom.Table.td>
            </ElixirLizardsWeb.Components.Chelekom.Table.tr>

            <ElixirLizardsWeb.Components.Chelekom.Table.tr>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>Carol White</ElixirLizardsWeb.Components.Chelekom.Table.td>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>Manager</ElixirLizardsWeb.Components.Chelekom.Table.td>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>
                <ElixirLizardsWeb.Components.Chelekom.Badge.badge color="info">Meeting</ElixirLizardsWeb.Components.Chelekom.Badge.badge>
              </ElixirLizardsWeb.Components.Chelekom.Table.td>
              <ElixirLizardsWeb.Components.Chelekom.Table.td>
                <ElixirLizardsWeb.Components.Chelekom.Button.button size="extra_small" variant="ghost">Edit</ElixirLizardsWeb.Components.Chelekom.Button.button>
              </ElixirLizardsWeb.Components.Chelekom.Table.td>
            </ElixirLizardsWeb.Components.Chelekom.Table.tr>

            <:footer>Total: 3 team members</:footer>
          </ElixirLizardsWeb.Components.Chelekom.Table.table>
        </div>
      </section>

    <!-- Modal Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Modal Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Dialog windows for important interactions and confirmations
          </p>
        </div>

        <div class="flex justify-center">
          <ElixirLizardsWeb.Components.Chelekom.Button.button phx-click={ElixirLizardsWeb.Components.Chelekom.Modal.show_modal("demo-modal")}>
            Open Modal
          </ElixirLizardsWeb.Components.Chelekom.Button.button>
        </div>

        <ElixirLizardsWeb.Components.Chelekom.Modal.modal id="demo-modal" title="Example Modal" rounded="large">
          <p class="mb-4">
            This is a modal dialog. Modals are useful for confirmations, forms, or displaying important information that requires user attention.
          </p>
          <p class="text-sm text-base-content/70">
            Click outside the modal or press ESC to close.
          </p>
        </ElixirLizardsWeb.Components.Chelekom.Modal.modal>
      </section>

    <!-- Dropdown Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Dropdown Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Expandable menus for actions and navigation options
          </p>
        </div>

        <div class="flex flex-wrap gap-6 justify-center">
          <ElixirLizardsWeb.Components.Chelekom.Dropdown.dropdown id="demo-dropdown-1" position="bottom" clickable rounded="medium">
            <:trigger>
              <ElixirLizardsWeb.Components.Chelekom.Button.button>
                Click Me <.icon name="hero-chevron-down" class="size-4 ml-1" />
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
            </:trigger>
            <:content>
              <div class="py-1 min-w-32">
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Dashboard</div>
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Settings</div>
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Profile</div>
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer text-error">Sign Out</div>
              </div>
            </:content>
          </ElixirLizardsWeb.Components.Chelekom.Dropdown.dropdown>

          <ElixirLizardsWeb.Components.Chelekom.Dropdown.dropdown id="demo-dropdown-2" position="bottom" clickable rounded="medium">
            <:trigger>
              <ElixirLizardsWeb.Components.Chelekom.Button.button variant="outline">
                Options <.icon name="hero-chevron-down" class="size-4 ml-1" />
              </ElixirLizardsWeb.Components.Chelekom.Button.button>
            </:trigger>
            <:content>
              <div class="py-1 min-w-32">
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Edit</div>
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Duplicate</div>
                <div class="px-3 py-2 hover:bg-base-200 cursor-pointer">Archive</div>
              </div>
            </:content>
          </ElixirLizardsWeb.Components.Chelekom.Dropdown.dropdown>
        </div>
      </section>

    <!-- Breadcrumb Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Breadcrumb Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Navigation trails showing the current page location
          </p>
        </div>

        <div class="space-y-4 flex flex-col items-center">
          <ElixirLizardsWeb.Components.Chelekom.Breadcrumb.breadcrumb>
            <:item icon="hero-home" link="/">Home</:item>
            <:item link="/dev">Development</:item>
            <:item>Chelekom</:item>
          </ElixirLizardsWeb.Components.Chelekom.Breadcrumb.breadcrumb>

          <ElixirLizardsWeb.Components.Chelekom.Breadcrumb.breadcrumb color="primary" size="medium">
            <:item icon="hero-folder">Projects</:item>
            <:item icon="hero-document">Documentation</:item>
            <:item icon="hero-code-bracket">Components</:item>
          </ElixirLizardsWeb.Components.Chelekom.Breadcrumb.breadcrumb>
        </div>
      </section>

    <!-- Pagination Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Pagination Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Navigate through pages of content
          </p>
        </div>

        <div class="space-y-6 flex flex-col items-center">
          <ElixirLizardsWeb.Components.Chelekom.Pagination.pagination total={10} active={3} siblings={1} />
          <ElixirLizardsWeb.Components.Chelekom.Pagination.pagination total={20} active={7} siblings={2} variant="outline" show_edges />
        </div>
      </section>

    <!-- Rating Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Rating Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Star ratings for reviews and feedback
          </p>
        </div>

        <div class="space-y-4 flex flex-col items-center">
          <div class="flex items-center gap-4">
            <span class="text-sm">3/5:</span>
            <ElixirLizardsWeb.Components.Chelekom.Rating.rating select={3} count={5} size="medium" />
          </div>
          <div class="flex items-center gap-4">
            <span class="text-sm">4.5/5:</span>
            <ElixirLizardsWeb.Components.Chelekom.Rating.rating select={4.5} count={5} size="large" color="warning" />
          </div>
          <div class="flex items-center gap-4">
            <span class="text-sm">Interactive:</span>
            <ElixirLizardsWeb.Components.Chelekom.Rating.rating select={0} count={5} size="large" color="primary" interactive />
          </div>
        </div>
      </section>

    <!-- Text Field Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Text Field Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Form inputs with labels, descriptions, and validation states
          </p>
        </div>

        <div class="max-w-md mx-auto space-y-4">
          <ElixirLizardsWeb.Components.Chelekom.TextField.text_field
            name="demo_name"
            value=""
            label="Your Name"
            placeholder="Enter your name"
            floating="outer"
          />
          <ElixirLizardsWeb.Components.Chelekom.TextField.text_field
            name="demo_email"
            value=""
            label="Email Address"
            placeholder="you@example.com"
            description="We'll never share your email"
            floating="outer"
          />
          <ElixirLizardsWeb.Components.Chelekom.TextField.text_field
            name="demo_error"
            value="invalid"
            label="With Error"
            color="danger"
            floating="outer"
          >
            <:end_section>
              <.icon name="hero-exclamation-circle" class="size-5 text-error" />
            </:end_section>
          </ElixirLizardsWeb.Components.Chelekom.TextField.text_field>
        </div>
      </section>

    <!-- Skeleton Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Skeleton Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Loading placeholders for content that is being fetched
          </p>
        </div>

        <div class="max-w-md mx-auto space-y-4">
          <div class="flex items-center gap-4">
            <ElixirLizardsWeb.Components.Chelekom.Skeleton.skeleton width="w-12" height="h-12" rounded="full" animated />
            <div class="flex-1 space-y-2">
              <ElixirLizardsWeb.Components.Chelekom.Skeleton.skeleton width="w-3/4" height="small" animated />
              <ElixirLizardsWeb.Components.Chelekom.Skeleton.skeleton width="w-1/2" height="extra_small" animated />
            </div>
          </div>
          <ElixirLizardsWeb.Components.Chelekom.Skeleton.skeleton width="full" height="medium" animated />
          <ElixirLizardsWeb.Components.Chelekom.Skeleton.skeleton width="full" height="extra_large" animated />
        </div>
      </section>

    <!-- Divider Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Divider Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Visual separators for content sections
          </p>
        </div>

        <div class="max-w-xl mx-auto space-y-8">
          <ElixirLizardsWeb.Components.Chelekom.Divider.divider />
          <ElixirLizardsWeb.Components.Chelekom.Divider.divider type="dashed" color="primary" />
          <ElixirLizardsWeb.Components.Chelekom.Divider.divider type="dotted" color="secondary">
            <:text>OR</:text>
          </ElixirLizardsWeb.Components.Chelekom.Divider.divider>
          <ElixirLizardsWeb.Components.Chelekom.Divider.divider color="success">
            <:icon name="hero-sparkles" class="px-2 bg-base-100" />
          </ElixirLizardsWeb.Components.Chelekom.Divider.divider>
        </div>
      </section>

    <!-- Drawer Components -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Drawer Components</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Sliding panels for navigation and additional content
          </p>
        </div>

        <div class="flex flex-wrap gap-4 justify-center">
          <ElixirLizardsWeb.Components.Chelekom.Button.button phx-click={ElixirLizardsWeb.Components.Chelekom.Drawer.show_drawer("demo-drawer-left", "left")}>
            Open Left Drawer
          </ElixirLizardsWeb.Components.Chelekom.Button.button>
          <ElixirLizardsWeb.Components.Chelekom.Button.button variant="outline" phx-click={ElixirLizardsWeb.Components.Chelekom.Drawer.show_drawer("demo-drawer-right", "right")}>
            Open Right Drawer
          </ElixirLizardsWeb.Components.Chelekom.Button.button>
        </div>

        <ElixirLizardsWeb.Components.Chelekom.Drawer.drawer id="demo-drawer-left" title="Left Drawer" position="left">
          <p class="mb-4">This drawer slides in from the left side of the screen.</p>
          <p class="text-sm text-base-content/70">Click outside or the X button to close.</p>
        </ElixirLizardsWeb.Components.Chelekom.Drawer.drawer>

        <ElixirLizardsWeb.Components.Chelekom.Drawer.drawer id="demo-drawer-right" title="Right Drawer" position="right">
          <p class="mb-4">This drawer slides in from the right side of the screen.</p>
          <p class="text-sm text-base-content/70">Great for settings panels or navigation menus.</p>
        </ElixirLizardsWeb.Components.Chelekom.Drawer.drawer>
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
          <ElixirLizardsWeb.Components.Chelekom.Alert.flash_group flash={
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
          <h2 class="text-3xl font-bold mb-2">22 Components Installed</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Mishka Chelekom components are ready to use in your application
          </p>
        </div>

        <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-2 max-w-4xl mx-auto text-sm">
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Accordion</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Alert</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Avatar</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Badge</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Breadcrumb</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Button</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Card</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Divider</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Drawer</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Dropdown</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Menu</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Modal</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Navbar</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Pagination</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Progress</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Rating</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Skeleton</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Spinner</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Table</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Tabs</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>TextField</span>
          </div>
          <div class="flex items-center gap-2 p-2 rounded bg-base-200">
            <.icon name="hero-check" class="size-4 text-success" />
            <span>Tooltip</span>
          </div>
        </div>

        <div class="text-center mt-6">
          <p class="text-sm text-base-content/70">
            Access this showcase at: <code class="bg-base-200 px-2 py-1 rounded">/dev/chelekom</code>
          </p>
        </div>
      </section>
      </div>
    </Layouts.app>
    """
  end
end
