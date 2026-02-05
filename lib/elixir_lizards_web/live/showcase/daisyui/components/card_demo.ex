defmodule ElixirLizardsWeb.Showcase.DaisyUI.Components.CardDemo do
  @moduledoc """
  Demo for the card component.
  """
  use ElixirLizardsWeb, :live_view

  @code_example """
  <.card variant="bordered">
    <:figure><img src="/image.jpg" /></:figure>
    <:title>Card Title</:title>
    <:body>Card content here</:body>
    <:actions><.button>Action</.button></:actions>
  </.card>
  """

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Card Component")
     |> assign(:code_example, @code_example)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/showcase/daisyui">Components</:crumb>
        <:crumb>Card</:crumb>
      </.breadcrumb>

      <.header>
        Card
        <:subtitle>Flexible content containers for displaying grouped information.</:subtitle>
        <:actions>
          <.button navigate="/showcase/daisyui">Back to Components</.button>
        </:actions>
      </.header>

      <div class="space-y-8">
        <section>
          <h3 class="text-lg font-semibold mb-4">Variants</h3>
          <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <.card>
              <:title>Simple Card</:title>
              <:body>
                This is a basic card with just a title and body content.
              </:body>
            </.card>

            <.card variant="bordered">
              <:title>Bordered Card</:title>
              <:body>
                A card with a visible border for emphasis.
              </:body>
              <:actions>
                <.button>Action</.button>
              </:actions>
            </.card>

            <.card variant="compact">
              <:figure>
                <div class="bg-primary/20 h-32 w-full flex items-center justify-center">
                  <.icon name="hero-photo" class="size-12 text-primary" />
                </div>
              </:figure>
              <:title>Card with Figure</:title>
              <:body>A compact card with an image placeholder.</:body>
            </.card>
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
