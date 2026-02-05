defmodule ElixirLizardsWeb.Showcase.DaisyUI.Components.AvatarDemo do
  @moduledoc """
  Demo for the avatar component.
  """
  use ElixirLizardsWeb, :live_view

  @code_example """
  <.avatar src="/user.jpg" alt="John Doe" />
  <.avatar placeholder="JD" size="lg" />
  <.avatar placeholder="AB" status="online" shape="squircle" />
  """

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Avatar Component")
     |> assign(:code_example, @code_example)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/showcase/daisyui">Components</:crumb>
        <:crumb>Avatar</:crumb>
      </.breadcrumb>

      <.header>
        Avatar
        <:subtitle>User profile images with fallbacks and status indicators.</:subtitle>
        <:actions>
          <.button navigate="/showcase/daisyui">Back to Components</.button>
        </:actions>
      </.header>

      <div class="space-y-8">
        <section>
          <h3 class="text-lg font-semibold mb-4">Sizes</h3>
          <div class="flex items-center gap-4">
            <.avatar placeholder="JD" size="xs" />
            <.avatar placeholder="AB" size="sm" />
            <.avatar placeholder="CD" size="md" />
            <.avatar placeholder="EF" size="lg" />
            <.avatar placeholder="GH" size="xl" />
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Status Indicators</h3>
          <div class="flex items-center gap-4">
            <.avatar placeholder="ON" status="online" />
            <.avatar placeholder="OF" status="offline" />
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Shapes</h3>
          <div class="flex items-center gap-4">
            <.avatar placeholder="C" shape="circle" />
            <.avatar placeholder="S" shape="squircle" />
            <.avatar placeholder="H" shape="hexagon" />
            <.avatar placeholder="T" shape="triangle" />
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Fallback Icon</h3>
          <div class="flex items-center gap-4">
            <.avatar size="sm" />
            <.avatar size="md" />
            <.avatar size="lg" />
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
