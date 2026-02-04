defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.OverlaysDemo do
  @moduledoc """
  Overlays components demo: Modal, Drawer, Tooltip
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Button, Drawer, Modal, Tooltip}

  def render(assigns) do
    ~H"""
    <div class="space-y-12">
      <!-- Modal -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Modal</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Dialog windows for important interactions and confirmations
          </p>
        </div>

        <div class="flex justify-center">
          <Button.button phx-click={Modal.show_modal("overlay-modal")}>
            Open Modal
          </Button.button>
        </div>

        <Modal.modal id="overlay-modal" title="Example Modal" rounded="large">
          <p class="mb-4">
            This is a modal dialog. Modals are useful for confirmations, forms, or displaying important information that requires user attention.
          </p>
          <p class="text-sm text-base-content/70">
            Click outside the modal or press ESC to close.
          </p>
        </Modal.modal>
      </section>

      <!-- Drawer -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Drawer</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Sliding panels for navigation and additional content
          </p>
        </div>

        <div class="flex flex-wrap gap-4 justify-center">
          <Button.button phx-click={Drawer.show_drawer("overlay-drawer-left", "left")}>
            Open Left Drawer
          </Button.button>
          <Button.button variant="outline" phx-click={Drawer.show_drawer("overlay-drawer-right", "right")}>
            Open Right Drawer
          </Button.button>
        </div>

        <Drawer.drawer id="overlay-drawer-left" title="Left Drawer" position="left">
          <p class="mb-4">This drawer slides in from the left side of the screen.</p>
          <p class="text-sm text-base-content/70">Click outside or the X button to close.</p>
        </Drawer.drawer>

        <Drawer.drawer id="overlay-drawer-right" title="Right Drawer" position="right">
          <p class="mb-4">This drawer slides in from the right side of the screen.</p>
          <p class="text-sm text-base-content/70">Great for settings panels or navigation menus.</p>
        </Drawer.drawer>
      </section>

      <!-- Tooltip -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Tooltip</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Contextual information on hover for enhanced UX
          </p>
        </div>

        <div class="flex flex-wrap gap-6 justify-center">
          <Tooltip.tooltip position="top" color="natural">
            <:trigger>
              <Button.button variant="outline">Top Tooltip</Button.button>
            </:trigger>
            <:content>Tooltip on top</:content>
          </Tooltip.tooltip>

          <Tooltip.tooltip position="bottom" color="primary">
            <:trigger>
              <Button.button variant="outline">Bottom Tooltip</Button.button>
            </:trigger>
            <:content>Tooltip on bottom</:content>
          </Tooltip.tooltip>

          <Tooltip.tooltip position="left" color="success">
            <:trigger>
              <Button.button variant="outline">Left Tooltip</Button.button>
            </:trigger>
            <:content>Tooltip on left</:content>
          </Tooltip.tooltip>

          <Tooltip.tooltip position="right" color="warning">
            <:trigger>
              <Button.button variant="outline">Right Tooltip</Button.button>
            </:trigger>
            <:content>Tooltip on right</:content>
          </Tooltip.tooltip>
        </div>
      </section>
    </div>
    """
  end
end
