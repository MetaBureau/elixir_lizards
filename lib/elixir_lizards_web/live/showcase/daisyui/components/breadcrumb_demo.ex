defmodule ElixirLizardsWeb.Showcase.DaisyUI.Components.BreadcrumbDemo do
  @moduledoc """
  Demo for the breadcrumb component.
  """
  use ElixirLizardsWeb, :live_view

  @code_example """
  <.breadcrumb>
    <:crumb navigate={~p"/"}>Home</:crumb>
    <:crumb navigate={~p"/users"}>Users</:crumb>
    <:crumb>Edit User</:crumb>
  </.breadcrumb>
  """

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Breadcrumb Component")
     |> assign(:code_example, @code_example)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/dev/components/daisyui">Components</:crumb>
        <:crumb>Breadcrumb</:crumb>
      </.breadcrumb>

      <.header>
        Breadcrumb
        <:subtitle>Navigation trail showing the current page location.</:subtitle>
        <:actions>
          <.button navigate="/dev/components/daisyui">Back to Components</.button>
        </:actions>
      </.header>

      <div class="space-y-8">
        <section>
          <h3 class="text-lg font-semibold mb-4">Basic Breadcrumb</h3>
          <.breadcrumb>
            <:crumb navigate={~p"/"}>Home</:crumb>
            <:crumb>Documents</:crumb>
            <:crumb>Projects</:crumb>
            <:crumb>Current Page</:crumb>
          </.breadcrumb>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">With Navigation</h3>
          <.breadcrumb>
            <:crumb navigate={~p"/"}>Home</:crumb>
            <:crumb navigate="/dev/components/daisyui">Components</:crumb>
            <:crumb>Current</:crumb>
          </.breadcrumb>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Long Trail</h3>
          <.breadcrumb>
            <:crumb navigate={~p"/"}>Home</:crumb>
            <:crumb>Category</:crumb>
            <:crumb>Subcategory</:crumb>
            <:crumb>Section</:crumb>
            <:crumb>Subsection</:crumb>
            <:crumb>Current Page</:crumb>
          </.breadcrumb>
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
