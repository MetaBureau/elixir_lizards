defmodule ElixirLizardsWeb.Components.DaisyUI.Tooltip do
  @moduledoc """
  Tooltip component with DaisyUI styling.
  """
  use Phoenix.Component

  @doc """
  Renders a tooltip component.

  ## Examples

      <.tooltip content="More information here">
        <.icon name="hero-question-mark-circle" />
      </.tooltip>

      <.tooltip content="Click to save" position="bottom">
        <.button>Save</.button>
      </.tooltip>
  """
  attr :content, :string, required: true
  attr :position, :string, default: nil, values: [nil, "top", "bottom", "left", "right"]

  attr :variant, :string,
    default: nil,
    values: [nil, "primary", "secondary", "accent", "info", "success", "warning", "error"]

  attr :open, :boolean, default: false, doc: "force the tooltip to be open"
  attr :class, :any, default: nil

  slot :inner_block, required: true

  def tooltip(assigns) do
    ~H"""
    <div
      class={[
        "tooltip",
        @position && "tooltip-#{@position}",
        @variant && "tooltip-#{@variant}",
        @open && "tooltip-open",
        @class
      ]}
      data-tip={@content}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end
end
