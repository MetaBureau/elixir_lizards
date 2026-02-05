defmodule ElixirLizardsWeb.Showcase.DaisyUI.Components.DropdownDemo do
  @moduledoc """
  Demo for the dropdown component.
  """
  use ElixirLizardsWeb, :live_view

  @code_example """
  <.dropdown position="end" hover>
    <:trigger><.button>Menu</.button></:trigger>
    <:item>Profile</:item>
    <:item navigate={~p"/settings"}>Settings</:item>
    <:item phx-click="logout">Logout</:item>
  </.dropdown>
  """

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Dropdown Component")
     |> assign(:code_example, @code_example)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/showcase/daisyui">Components</:crumb>
        <:crumb>Dropdown</:crumb>
      </.breadcrumb>

      <.header>
        Dropdown
        <:subtitle>Contextual menus triggered by buttons or other elements.</:subtitle>
        <:actions>
          <.button navigate="/showcase/daisyui">Back to Components</.button>
        </:actions>
      </.header>

      <div class="space-y-8">
        <section>
          <h3 class="text-lg font-semibold mb-4">Trigger Modes</h3>
          <div class="flex gap-4">
            <.dropdown>
              <:trigger><.button>Click Menu</.button></:trigger>
              <:item>Profile</:item>
              <:item>Settings</:item>
              <:item>Notifications</:item>
              <:item navigate={~p"/"}>Home</:item>
            </.dropdown>

            <.dropdown hover>
              <:trigger><.button>Hover Menu</.button></:trigger>
              <:item>Option 1</:item>
              <:item>Option 2</:item>
              <:item>Option 3</:item>
            </.dropdown>
          </div>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Positioning</h3>
          <div class="flex gap-4">
            <.dropdown>
              <:trigger><.button>Default</.button></:trigger>
              <:item>Item A</:item>
              <:item>Item B</:item>
            </.dropdown>

            <.dropdown position="end">
              <:trigger><.button>End</.button></:trigger>
              <:item>Item A</:item>
              <:item>Item B</:item>
            </.dropdown>

            <.dropdown position="top">
              <:trigger><.button>Top</.button></:trigger>
              <:item>Item A</:item>
              <:item>Item B</:item>
            </.dropdown>
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
