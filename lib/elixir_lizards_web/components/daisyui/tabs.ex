defmodule ElixirLizardsWeb.Components.DaisyUI.Tabs do
  @moduledoc """
  Tabs component with DaisyUI styling.
  """
  use Phoenix.Component

  @doc """
  Renders a tabs component.

  ## Examples

      <.tabs>
        <:tab active>All Users</:tab>
        <:tab>Active</:tab>
        <:tab>Inactive</:tab>
      </.tabs>

      <.tabs variant="boxed">
        <:tab patch={~p"/users?tab=all"} active={@tab == "all"}>All</:tab>
        <:tab patch={~p"/users?tab=active"} active={@tab == "active"}>Active</:tab>
      </.tabs>
  """
  attr :variant, :string, default: nil, values: [nil, "boxed", "bordered", "lifted"]
  attr :size, :string, default: nil, values: [nil, "xs", "sm", "md", "lg"]
  attr :class, :any, default: nil

  slot :tab, required: true do
    attr :active, :boolean
    attr :disabled, :boolean
    attr :navigate, :string
    attr :patch, :string
    attr :href, :string
  end

  def tabs(assigns) do
    ~H"""
    <div
      role="tablist"
      class={[
        "d-tabs",
        @variant && "d-tabs-#{@variant}",
        @size && "d-tabs-#{@size}",
        @class
      ]}
    >
      <.link
        :for={tab <- @tab}
        :if={tab[:navigate] || tab[:patch] || tab[:href]}
        navigate={tab[:navigate]}
        patch={tab[:patch]}
        href={tab[:href]}
        role="tab"
        class={[
          "d-tab",
          tab[:active] && "d-tab-active",
          tab[:disabled] && "d-tab-disabled"
        ]}
      >
        {render_slot(tab)}
      </.link>
      <span
        :for={tab <- @tab}
        :if={!tab[:navigate] && !tab[:patch] && !tab[:href]}
        role="tab"
        class={[
          "d-tab",
          tab[:active] && "d-tab-active",
          tab[:disabled] && "d-tab-disabled"
        ]}
      >
        {render_slot(tab)}
      </span>
    </div>
    """
  end
end
