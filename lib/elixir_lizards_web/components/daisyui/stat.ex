defmodule ElixirLizardsWeb.Components.DaisyUI.Stat do
  @moduledoc """
  Stat components with DaisyUI styling.
  """
  use Phoenix.Component
  import ElixirLizardsWeb.Components.DaisyUI.Icon, only: [icon: 1]

  @doc """
  Renders a group of stat components.

  ## Examples

      <.stat_group>
        <.stat title="Total Users" value="31,245" />
        <.stat title="Revenue" value="$12,500" description="+12% from last month" />
      </.stat_group>
  """
  attr :class, :any, default: nil

  slot :inner_block, required: true

  def stat_group(assigns) do
    ~H"""
    <div class={["d-stats shadow", @class]}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Renders a single stat component.

  ## Examples

      <.stat title="Downloads" value="31K" />
      <.stat title="Revenue" value="$12,500" description="+12%" icon="hero-currency-dollar" />
      <.stat title="Tasks" value="86%" description="Completed" variant="info" />
  """
  attr :title, :string, required: true
  attr :value, :any, required: true, doc: "the stat value (string or number)"
  attr :description, :string, default: nil
  attr :icon, :string, default: nil

  attr :variant, :string,
    default: nil,
    values: [nil, "primary", "secondary", "accent", "info", "success", "warning", "error"]

  attr :class, :any, default: nil

  def stat(assigns) do
    ~H"""
    <div class={["d-stat", @class]}>
      <div :if={@icon} class={["d-stat-figure", @variant && "text-#{@variant}"]}>
        <.icon name={@icon} class="size-8" />
      </div>
      <div class="d-stat-title">{@title}</div>
      <div class={["d-stat-value", @variant && "text-#{@variant}"]}>{@value}</div>
      <div :if={@description} class="d-stat-desc">{@description}</div>
    </div>
    """
  end
end
