defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ModalDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Button, Modal}

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Modal</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Dialog windows for important interactions and confirmations
        </p>
      </div>

      <div class="flex justify-center">
        <Button.button
          variant="default"
          color="primary"
          phx-click={Modal.show_modal("chelekom-modal")}
        >
          Open Modal
        </Button.button>
      </div>

      <Modal.modal id="chelekom-modal" title="Example Modal" rounded="large">
        <p class="mb-4">
          This is a modal dialog. Modals are useful for confirmations, forms, or displaying important information that requires user attention.
        </p>
        <p class="text-sm text-base-content/70">
          Click outside the modal or press ESC to close.
        </p>
      </Modal.modal>
    </div>
    """
  end
end
