defmodule ElixirLizardsWeb.Showcase.DaisyUI.Components.TooltipDemo do
  @moduledoc """
  Demo for the tooltip component.
  """
  use ElixirLizardsWeb, :live_view

  @code_example """
  <.tooltip content="More information here" position="top">
    <.icon name="hero-question-mark-circle" />
  </.tooltip>

  <.tooltip content="Click to save" variant="success">
    <.button>Save</.button>
  </.tooltip>
  """

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Tooltip Component")
     |> assign(:code_example, @code_example)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/showcase/daisyui">Components</:crumb>
        <:crumb>Tooltip</:crumb>
      </.breadcrumb>

      <.header>
        Tooltip
        <:subtitle>Contextual hints that appear on hover.</:subtitle>
        <:actions>
          <.button navigate="/showcase/daisyui">Back to Components</.button>
        </:actions>
      </.header>

      <div class="space-y-8">
        <section>
          <h3 class="text-lg font-semibold mb-4">Positions</h3>
          <div class="flex gap-8 items-center justify-center py-8">
            <.tooltip content="Tooltip on top" position="top">
              <.button>Top</.button>
            </.tooltip>

            <.tooltip content="Tooltip on bottom" position="bottom">
              <.button>Bottom</.button>
            </.tooltip>

            <.tooltip content="Tooltip on left" position="left">
              <.button>Left</.button>
            </.tooltip>

            <.tooltip content="Tooltip on right" position="right">
              <.button>Right</.button>
            </.tooltip>
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Color Variants</h3>
          <div class="flex gap-4 items-center justify-center py-4">
            <.tooltip content="Primary tooltip" variant="primary">
              <.badge variant="primary">Primary</.badge>
            </.tooltip>

            <.tooltip content="Success tooltip" variant="success">
              <.badge variant="success">Success</.badge>
            </.tooltip>

            <.tooltip content="Warning tooltip" variant="warning">
              <.badge variant="warning">Warning</.badge>
            </.tooltip>

            <.tooltip content="Error tooltip" variant="error">
              <.badge variant="error">Error</.badge>
            </.tooltip>
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Force Open</h3>
          <div class="flex justify-center py-4">
            <.tooltip content="I'm always visible!" open>
              <.button>Always Visible</.button>
            </.tooltip>
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Usage</h3>
          <div class="d-mockup-code">
            <pre><code>{@code_example}</code></pre>
          </div>
        </section>
      </div>
    </Layouts.app>
    """
  end
end
