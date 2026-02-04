defmodule ElixirLizardsWeb.Components.DaisyUI.Breadcrumb do
  @moduledoc """
  Breadcrumb navigation component with DaisyUI styling.
  """
  use Phoenix.Component

  @doc """
  Renders a breadcrumb navigation component.

  ## Examples

      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate={~p"/users"}>Users</:crumb>
        <:crumb>Edit User</:crumb>
      </.breadcrumb>
  """
  attr :class, :any, default: nil

  slot :crumb, required: true do
    attr :navigate, :string
    attr :patch, :string
    attr :href, :string
  end

  def breadcrumb(assigns) do
    ~H"""
    <div class={["breadcrumbs text-sm", @class]}>
      <ul>
        <li :for={crumb <- @crumb}>
          <.link
            :if={crumb[:navigate] || crumb[:patch] || crumb[:href]}
            navigate={crumb[:navigate]}
            patch={crumb[:patch]}
            href={crumb[:href]}
          >
            {render_slot(crumb)}
          </.link>
          <span :if={!crumb[:navigate] && !crumb[:patch] && !crumb[:href]}>
            {render_slot(crumb)}
          </span>
        </li>
      </ul>
    </div>
    """
  end
end
