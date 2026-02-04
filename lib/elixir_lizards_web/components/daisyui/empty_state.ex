defmodule ElixirLizardsWeb.Components.DaisyUI.EmptyState do
  @moduledoc """
  Empty state placeholder component with DaisyUI styling.
  """
  use Phoenix.Component
  import ElixirLizardsWeb.Components.DaisyUI.Icon, only: [icon: 1]

  @doc """
  Renders an empty state placeholder for collections.

  ## Examples

      <.empty_state title="No documents">
        <:description>Get started by creating your first document.</:description>
        <:action><.button>Create Document</.button></:action>
      </.empty_state>

      <.empty_state icon="hero-inbox" title="No messages">
        <:description>Your inbox is empty.</:description>
      </.empty_state>
  """
  attr :icon, :string, default: "hero-folder-open"
  attr :title, :string, required: true
  attr :class, :any, default: nil

  slot :description
  slot :action

  def empty_state(assigns) do
    ~H"""
    <div class={["flex flex-col items-center justify-center py-12 px-4 text-center", @class]}>
      <div class="rounded-full bg-base-200 p-4 mb-4">
        <.icon name={@icon} class="size-12 text-base-content/50" />
      </div>
      <h3 class="text-lg font-semibold text-base-content mb-2">{@title}</h3>
      <p :if={@description != []} class="text-sm text-base-content/70 mb-4 max-w-sm">
        {render_slot(@description)}
      </p>
      <div :if={@action != []}>
        {render_slot(@action)}
      </div>
    </div>
    """
  end
end
