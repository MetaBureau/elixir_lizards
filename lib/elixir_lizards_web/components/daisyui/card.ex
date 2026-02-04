defmodule ElixirLizardsWeb.Components.DaisyUI.Card do
  @moduledoc """
  Card component with DaisyUI styling.
  """
  use Phoenix.Component

  @doc """
  Renders a card component.

  ## Examples

      <.card>
        <:title>Card Title</:title>
        <:body>This is the card content.</:body>
      </.card>

      <.card variant="bordered">
        <:figure><img src="/images/photo.jpg" alt="Photo" /></:figure>
        <:title>Photo Card</:title>
        <:body>A card with an image.</:body>
        <:actions><.button>View</.button></:actions>
      </.card>
  """
  attr :class, :any, default: nil
  attr :variant, :string, default: nil, values: [nil, "bordered", "compact"]

  slot :figure, doc: "optional image or media at the top of the card"
  slot :title, doc: "the card title"
  slot :body, doc: "the main card content"
  slot :actions, doc: "action buttons at the bottom of the card"

  def card(assigns) do
    ~H"""
    <div class={[
      "card bg-base-100",
      @variant == "bordered" && "card-border border-base-300",
      @variant == "compact" && "card-compact",
      @class
    ]}>
      <figure :if={@figure != []}>
        {render_slot(@figure)}
      </figure>
      <div class="card-body">
        <h2 :if={@title != []} class="card-title">
          {render_slot(@title)}
        </h2>
        <div :if={@body != []}>
          {render_slot(@body)}
        </div>
        <div :if={@actions != []} class="card-actions justify-end">
          {render_slot(@actions)}
        </div>
      </div>
    </div>
    """
  end
end
