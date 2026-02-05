defmodule ElixirLizardsWeb.Components.DaisyUI.List do
  @moduledoc """
  List component with DaisyUI styling.
  """
  use Phoenix.Component

  @doc """
  Renders a data list.

  ## Examples

      <.list>
        <:item title="Title">{@post.title}</:item>
        <:item title="Views">{@post.views}</:item>
      </.list>
  """
  slot :item, required: true do
    attr :title, :string, required: true
  end

  def list(assigns) do
    ~H"""
    <ul class="d-list">
      <li :for={item <- @item} class="d-list-row">
        <div class="d-list-col-grow">
          <div class="font-bold">{item.title}</div>
          <div>{render_slot(item)}</div>
        </div>
      </li>
    </ul>
    """
  end
end
