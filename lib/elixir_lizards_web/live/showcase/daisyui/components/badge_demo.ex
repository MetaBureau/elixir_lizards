defmodule ElixirLizardsWeb.Showcase.DaisyUI.Components.BadgeDemo do
  @moduledoc """
  Demo for the badge component.
  """
  use ElixirLizardsWeb, :live_view

  @code_example """
  <.badge>Default</.badge>
  <.badge variant="success">Active</.badge>
  <.badge variant="error" size="lg" outline>Critical</.badge>
  """

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Badge Component")
     |> assign(:code_example, @code_example)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/dev/components/daisyui">Components</:crumb>
        <:crumb>Badge</:crumb>
      </.breadcrumb>

      <.header>
        Badge
        <:subtitle>Status indicators and labels for categorization.</:subtitle>
        <:actions>
          <.button navigate="/dev/components/daisyui">Back to Components</.button>
        </:actions>
      </.header>

      <div class="space-y-8">
        <section>
          <h3 class="text-lg font-semibold mb-4">Color Variants</h3>
          <div class="flex flex-wrap gap-2 mb-4">
            <.badge>Default</.badge>
            <.badge variant="primary">Primary</.badge>
            <.badge variant="secondary">Secondary</.badge>
            <.badge variant="accent">Accent</.badge>
            <.badge variant="ghost">Ghost</.badge>
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Status Variants</h3>
          <div class="flex flex-wrap gap-2 mb-4">
            <.badge variant="info">Info</.badge>
            <.badge variant="success">Success</.badge>
            <.badge variant="warning">Warning</.badge>
            <.badge variant="error">Error</.badge>
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Outline Style</h3>
          <div class="flex flex-wrap gap-2 mb-4">
            <.badge variant="primary" outline>Outline</.badge>
            <.badge variant="success" outline>Outline</.badge>
            <.badge variant="error" outline>Outline</.badge>
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Sizes</h3>
          <div class="flex flex-wrap gap-2 items-center">
            <.badge size="xs">XS</.badge>
            <.badge size="sm">SM</.badge>
            <.badge size="md">MD</.badge>
            <.badge size="lg">LG</.badge>
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Usage</h3>
          <div class="mockup-code">
            <pre><code>{@code_example}</code></pre>
          </div>
        </section>
      </div>
    </Layouts.app>
    """
  end
end
