defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.GeneralDemo do
  @moduledoc """
  General components demo: Button, Badge, Card, Divider, Accordion, Tabs, Table, Rating
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{
    Accordion,
    Badge,
    Button,
    Card,
    Divider,
    Rating,
    Table,
    Tabs
  }

  def render(assigns) do
    ~H"""
    <div class="space-y-12">
      <!-- Button -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Button</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Interactive buttons with variants, sizes, and states
          </p>
        </div>

        <div class="space-y-4">
          <div>
            <h3 class="text-lg font-semibold mb-3 text-center">Variants</h3>
            <div class="flex flex-wrap gap-3 justify-center">
              <Button.button>Default</Button.button>
              <Button.button variant="primary">Primary</Button.button>
              <Button.button variant="outline">Outline</Button.button>
              <Button.button variant="ghost">Ghost</Button.button>
              <Button.button variant="link">Link</Button.button>
            </div>
          </div>

          <div>
            <h3 class="text-lg font-semibold mb-3 text-center">Colors</h3>
            <div class="flex flex-wrap gap-3 justify-center">
              <Button.button color="success">Success</Button.button>
              <Button.button color="warning">Warning</Button.button>
              <Button.button color="error">Error</Button.button>
              <Button.button color="info">Info</Button.button>
            </div>
          </div>

          <div>
            <h3 class="text-lg font-semibold mb-3 text-center">Sizes</h3>
            <div class="flex flex-wrap gap-3 justify-center items-center">
              <Button.button size="extra_small">XS</Button.button>
              <Button.button size="small">SM</Button.button>
              <Button.button size="medium">MD</Button.button>
              <Button.button size="large">LG</Button.button>
              <Button.button size="extra_large">XL</Button.button>
            </div>
          </div>
        </div>
      </section>

      <!-- Badge -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Badge</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Small indicators with variants, sizes, and optional icons
          </p>
        </div>

        <div class="flex flex-wrap gap-3 justify-center">
          <Badge.badge>Default</Badge.badge>
          <Badge.badge variant="primary">Primary</Badge.badge>
          <Badge.badge variant="secondary">Secondary</Badge.badge>
          <Badge.badge color="success">Success</Badge.badge>
          <Badge.badge color="warning">Warning</Badge.badge>
          <Badge.badge color="error">Error</Badge.badge>
          <Badge.badge variant="outline">Outline</Badge.badge>
        </div>
      </section>

      <!-- Card -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Card</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Flexible content containers with titles, media, content, and footers
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <Card.card padding="medium" rounded="large">
            <Card.card_title title="Basic Card" icon="hero-document-text" />
            <Card.card_content>
              A simple card with title, icon, and content section.
            </Card.card_content>
          </Card.card>

          <Card.card padding="medium" rounded="large">
            <Card.card_title title="With Footer" icon="hero-chat-bubble-left" />
            <Card.card_content>
              Cards can include footer sections for actions.
            </Card.card_content>
            <Card.card_footer class="flex gap-2">
              <Button.button size="small">Action</Button.button>
              <Button.button size="small" variant="outline">Cancel</Button.button>
            </Card.card_footer>
          </Card.card>

          <Card.card variant="outline" color="success" padding="medium" rounded="large">
            <Card.card_title title="Outline Variant" icon="hero-check-circle" />
            <Card.card_content>
              Outline style with success color theme.
            </Card.card_content>
          </Card.card>
        </div>
      </section>

      <!-- Divider -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Divider</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Visual separators for content sections
          </p>
        </div>

        <div class="max-w-xl mx-auto space-y-8">
          <Divider.divider />
          <Divider.divider type="dashed" color="primary" />
          <Divider.divider type="dotted" color="secondary">
            <:text>OR</:text>
          </Divider.divider>
          <Divider.divider color="success">
            <:icon name="hero-sparkles" class="px-2 bg-base-100" />
          </Divider.divider>
        </div>
      </section>

      <!-- Accordion -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Accordion</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Collapsible content sections for FAQs and expandable information
          </p>
        </div>

        <div class="max-w-2xl mx-auto">
          <Accordion.accordion id="general-accordion" color="natural" rounded="medium">
            <:item id="gen-faq-1" title="What is Mishka Chelekom?" icon="hero-question-mark-circle" open>
              Mishka Chelekom is a zero-configuration UI component library for Phoenix LiveView.
            </:item>
            <:item id="gen-faq-2" title="How do I install components?" icon="hero-arrow-down-tray">
              Use the mix task: <code>mix mishka.ui.gen.component component_name</code>
            </:item>
            <:item id="gen-faq-3" title="Are components customizable?" icon="hero-paint-brush">
              Yes! Every component supports variants, colors, sizes, and custom CSS classes.
            </:item>
          </Accordion.accordion>
        </div>
      </section>

      <!-- Tabs -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Tabs</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Organize content into switchable panels
          </p>
        </div>

        <div class="max-w-2xl mx-auto">
          <Tabs.tabs id="general-tabs" color="primary" variant="pills" padding="small">
            <:tab icon="hero-home" active>Home</:tab>
            <:tab icon="hero-user">Profile</:tab>
            <:tab icon="hero-cog-6-tooth">Settings</:tab>

            <:panel>
              <div class="p-4">
                <h3 class="font-semibold mb-2">Welcome Home</h3>
                <p>This is the home tab content.</p>
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
                <p>Customize your application preferences.</p>
              </div>
            </:panel>
          </Tabs.tabs>
        </div>
      </section>

      <!-- Table -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Table</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Structured data display with headers, rows, and styling options
          </p>
        </div>

        <div class="max-w-4xl mx-auto">
          <Table.table rounded="medium" color="natural">
            <:header>Name</:header>
            <:header>Role</:header>
            <:header>Status</:header>
            <:header>Actions</:header>

            <Table.tr>
              <Table.td>Alice Johnson</Table.td>
              <Table.td>Developer</Table.td>
              <Table.td><Badge.badge color="success">Active</Badge.badge></Table.td>
              <Table.td><Button.button size="extra_small" variant="ghost">Edit</Button.button></Table.td>
            </Table.tr>

            <Table.tr>
              <Table.td>Bob Smith</Table.td>
              <Table.td>Designer</Table.td>
              <Table.td><Badge.badge color="warning">Away</Badge.badge></Table.td>
              <Table.td><Button.button size="extra_small" variant="ghost">Edit</Button.button></Table.td>
            </Table.tr>

            <Table.tr>
              <Table.td>Carol White</Table.td>
              <Table.td>Manager</Table.td>
              <Table.td><Badge.badge color="info">Meeting</Badge.badge></Table.td>
              <Table.td><Button.button size="extra_small" variant="ghost">Edit</Button.button></Table.td>
            </Table.tr>

            <:footer>Total: 3 team members</:footer>
          </Table.table>
        </div>
      </section>

      <!-- Rating -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Rating</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Star ratings for reviews and feedback
          </p>
        </div>

        <div class="space-y-4 flex flex-col items-center">
          <div class="flex items-center gap-4">
            <span class="text-sm">3/5:</span>
            <Rating.rating select={3} count={5} size="medium" />
          </div>
          <div class="flex items-center gap-4">
            <span class="text-sm">4.5/5:</span>
            <Rating.rating select={4.5} count={5} size="large" color="warning" />
          </div>
          <div class="flex items-center gap-4">
            <span class="text-sm">Interactive:</span>
            <Rating.rating select={0} count={5} size="large" color="primary" interactive />
          </div>
        </div>
      </section>
    </div>
    """
  end
end
