defmodule ElixirLizardsWeb.ComponentDemo.ModalDemo do
  @moduledoc """
  Demo for the modal component.
  """
  use ElixirLizardsWeb, :live_view

  @code_example """
  <.modal id="my-modal" on_cancel={hide_modal("my-modal")}>
    <:title>Modal Title</:title>
    <:subtitle>Optional subtitle</:subtitle>
    <p>Modal content here</p>
    <:actions>
      <.button phx-click={hide_modal("my-modal")}>Cancel</.button>
      <.button variant="primary">Confirm</.button>
    </:actions>
  </.modal>

  <.button phx-click={show_modal("my-modal")}>Open</.button>
  """

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Modal Component")
     |> assign(:code_example, @code_example)}
  end

  @impl true
  def handle_event("confirm-action", _params, socket) do
    {:noreply,
     socket
     |> put_flash(:info, "Action confirmed!")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/dev/components/daisyui">Components</:crumb>
        <:crumb>Modal</:crumb>
      </.breadcrumb>

      <.header>
        Modal
        <:subtitle>Modal dialogs for confirmations, forms, and focused interactions.</:subtitle>
        <:actions>
          <.button navigate="/dev/components/daisyui">Back to Components</.button>
        </:actions>
      </.header>

      <div class="space-y-8">
        <section>
          <h3 class="text-lg font-semibold mb-4">Basic Modal</h3>
          <.button phx-click={show_modal("demo-modal")}>Open Modal</.button>

          <.modal id="demo-modal" on_cancel={hide_modal("demo-modal")}>
            <:title>Confirm Action</:title>
            <:subtitle>This action cannot be undone.</:subtitle>
            <p>Are you sure you want to proceed with this action?</p>
            <:actions>
              <.button class="btn-ghost" phx-click={hide_modal("demo-modal")}>Cancel</.button>
              <.button variant="primary" phx-click="confirm-action">Confirm</.button>
            </:actions>
          </.modal>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Usage</h3>
          <div class="mockup-code">
            <pre><code>{@code_example}</code></pre>
          </div>
        </section>
      </div>
    </Layouts.app>
    """
  end
end
