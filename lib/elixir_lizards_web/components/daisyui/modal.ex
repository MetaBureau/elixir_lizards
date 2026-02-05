defmodule ElixirLizardsWeb.Components.DaisyUI.Modal do
  @moduledoc """
  Modal dialog component with DaisyUI styling.
  """
  use Phoenix.Component
  use Gettext, backend: ElixirLizardsWeb.Gettext
  alias Phoenix.LiveView.JS
  import ElixirLizardsWeb.Components.DaisyUI.Icon, only: [icon: 1]

  @doc """
  Renders a modal dialog.

  ## Examples

      <.modal id="confirm-modal" on_cancel={JS.navigate(~p"/")}>
        <:title>Confirm Action</:title>
        <p>Are you sure you want to proceed?</p>
        <:actions>
          <.button phx-click="confirm">Yes</.button>
        </:actions>
      </.modal>

  To show the modal, use `show_modal/1`. To hide it, use `hide_modal/1`.

      <.button phx-click={show_modal("confirm-modal")}>Open</.button>
  """
  attr :id, :string, required: true
  attr :on_cancel, JS, default: %JS{}
  attr :class, :any, default: nil

  slot :inner_block, required: true
  slot :title
  slot :subtitle
  slot :actions

  def modal(assigns) do
    ~H"""
    <dialog
      id={@id}
      class="d-modal"
      phx-mounted={JS.set_attribute({"open", "true"}, to: "##{@id}")}
      data-cancel={JS.exec(@on_cancel, "phx-remove")}
    >
      <div class={["d-modal-box", @class]}>
        <form method="dialog">
          <button
            type="button"
            class="d-btn d-btn-sm d-btn-circle d-btn-ghost absolute right-2 top-2"
            aria-label={gettext("close")}
            phx-click={hide_modal(@id) |> JS.exec("data-cancel", to: "##{@id}")}
          >
            <.icon name="hero-x-mark" class="size-5" />
          </button>
        </form>
        <h3 :if={@title != []} class="font-bold text-lg">
          {render_slot(@title)}
        </h3>
        <p :if={@subtitle != []} class="text-sm text-base-content/70">
          {render_slot(@subtitle)}
        </p>
        <div class="py-4">
          {render_slot(@inner_block)}
        </div>
        <div :if={@actions != []} class="d-modal-action">
          {render_slot(@actions)}
        </div>
      </div>
      <form method="dialog" class="d-modal-backdrop">
        <button type="button" phx-click={hide_modal(@id) |> JS.exec("data-cancel", to: "##{@id}")}>
          close
        </button>
      </form>
    </dialog>
    """
  end

  @doc """
  Shows a modal by ID.

  ## Examples

      <.button phx-click={show_modal("my-modal")}>Open Modal</.button>
  """
  def show_modal(js \\ %JS{}, id) when is_binary(id) do
    js
    |> JS.set_attribute({"open", "true"}, to: "##{id}")
    |> JS.focus_first(to: "##{id} .modal-box")
  end

  @doc """
  Hides a modal by ID.

  ## Examples

      <.button phx-click={hide_modal("my-modal")}>Close</.button>
  """
  def hide_modal(js \\ %JS{}, id) when is_binary(id) do
    js
    |> JS.remove_attribute("open", to: "##{id}")
  end
end
