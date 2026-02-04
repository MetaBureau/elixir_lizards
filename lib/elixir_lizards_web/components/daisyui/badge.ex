defmodule ElixirLizardsWeb.Components.DaisyUI.Badge do
  @moduledoc """
  Badge component with DaisyUI styling.
  """
  use Phoenix.Component

  @doc """
  Renders a badge component.

  ## Examples

      <.badge>Default</.badge>
      <.badge variant="primary">Primary</.badge>
      <.badge variant="success">Active</.badge>
      <.badge variant="error" size="lg">Critical</.badge>
      <.badge outline>Outlined</.badge>
  """
  attr :variant, :string,
    default: nil,
    values: [
      nil,
      "primary",
      "secondary",
      "accent",
      "info",
      "success",
      "warning",
      "error",
      "ghost"
    ]

  attr :size, :string, default: nil, values: [nil, "xs", "sm", "md", "lg"]
  attr :outline, :boolean, default: false
  attr :class, :any, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def badge(assigns) do
    ~H"""
    <span
      class={[
        "badge",
        @variant && "badge-#{@variant}",
        @size && "badge-#{@size}",
        @outline && "badge-outline",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end
end
