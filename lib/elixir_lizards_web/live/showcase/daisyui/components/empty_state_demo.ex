defmodule ElixirLizardsWeb.Showcase.DaisyUI.Components.EmptyStateDemo do
  @moduledoc """
  Demo for the empty_state component.
  """
  use ElixirLizardsWeb, :live_view

  @code_example """
  <.empty_state icon="hero-document-text" title="No documents">
    <:description>Get started by creating your first document.</:description>
    <:action><.button>Create Document</.button></:action>
  </.empty_state>
  """

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Empty State Component")
     |> assign(:code_example, @code_example)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/showcase/daisyui">Components</:crumb>
        <:crumb>Empty State</:crumb>
      </.breadcrumb>

      <.header>
        Empty State
        <:subtitle>Placeholder content for empty collections or search results.</:subtitle>
        <:actions>
          <.button navigate="/showcase/daisyui">Back to Components</.button>
        </:actions>
      </.header>

      <div class="space-y-8">
        <section>
          <h3 class="text-lg font-semibold mb-4">With Action</h3>
          <div class="border border-base-300 rounded-lg">
            <.empty_state title="No documents yet">
              <:description>Get started by creating your first document.</:description>
              <:action><.button>Create Document</.button></:action>
            </.empty_state>
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Search Results</h3>
          <div class="border border-base-300 rounded-lg">
            <.empty_state icon="hero-magnifying-glass" title="No results found">
              <:description>Try adjusting your search or filters.</:description>
            </.empty_state>
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Custom Icons</h3>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div class="border border-base-300 rounded-lg">
              <.empty_state icon="hero-inbox" title="No messages">
                <:description>Your inbox is empty.</:description>
              </.empty_state>
            </div>
            <div class="border border-base-300 rounded-lg">
              <.empty_state icon="hero-photo" title="No images">
                <:description>Upload some photos.</:description>
              </.empty_state>
            </div>
            <div class="border border-base-300 rounded-lg">
              <.empty_state icon="hero-users" title="No team members">
                <:description>Invite your team.</:description>
              </.empty_state>
            </div>
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
