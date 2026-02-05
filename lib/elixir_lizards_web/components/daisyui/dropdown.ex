defmodule ElixirLizardsWeb.Components.DaisyUI.Dropdown do
  @moduledoc """
  Dropdown menu component with DaisyUI styling.
  """
  use Phoenix.Component

  @doc """
  Renders a dropdown menu.

  ## Examples

      <.dropdown>
        <:trigger>
          <.button>Options</.button>
        </:trigger>
        <:item>Profile</:item>
        <:item>Settings</:item>
        <:item navigate={~p"/logout"}>Logout</:item>
      </.dropdown>

      <.dropdown position="end">
        <:trigger><.button>Menu</.button></:trigger>
        <:item phx-click="action">Action</:item>
      </.dropdown>
  """
  attr :class, :any, default: nil
  attr :position, :string, default: nil, values: [nil, "end", "top", "left", "right"]
  attr :hover, :boolean, default: false, doc: "open on hover instead of click"
  attr :rest, :global

  slot :trigger, required: true, doc: "the element that triggers the dropdown"

  slot :item, doc: "menu items" do
    attr :navigate, :string
    attr :patch, :string
    attr :href, :string
  end

  def dropdown(assigns) do
    ~H"""
    <div
      class={[
        "d-dropdown",
        @position && "d-dropdown-#{@position}",
        @hover && "d-dropdown-hover",
        @class
      ]}
      {@rest}
    >
      <div tabindex="0" role="button">
        {render_slot(@trigger)}
      </div>
      <ul tabindex="0" class="d-dropdown-content d-menu bg-base-100 d-rounded-box z-10 w-52 p-2 shadow-lg">
        <li :for={item <- @item}>
          <.link
            :if={item[:navigate] || item[:patch] || item[:href]}
            navigate={item[:navigate]}
            patch={item[:patch]}
            href={item[:href]}
          >
            {render_slot(item)}
          </.link>
          <span :if={!item[:navigate] && !item[:patch] && !item[:href]} role="menuitem">
            {render_slot(item)}
          </span>
        </li>
      </ul>
    </div>
    """
  end
end
