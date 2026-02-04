defmodule ElixirLizardsWeb.Showcase.DaisyUI.Components.TabsDemo do
  @moduledoc """
  Demo for the tabs component.
  """
  use ElixirLizardsWeb, :live_view

  @code_example """
  <.tabs variant="boxed">
    <:tab patch="/users?tab=all" active={@tab == "all"}>All</:tab>
    <:tab patch="/users?tab=active" active={@tab == "active"}>Active</:tab>
    <:tab disabled>Disabled</:tab>
  </.tabs>
  """

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Tabs Component")
     |> assign(:code_example, @code_example)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/dev/components/daisyui">Components</:crumb>
        <:crumb>Tabs</:crumb>
      </.breadcrumb>

      <.header>
        Tabs
        <:subtitle>Navigation tabs for switching between views.</:subtitle>
        <:actions>
          <.button navigate="/dev/components/daisyui">Back to Components</.button>
        </:actions>
      </.header>

      <div class="space-y-8">
        <section>
          <h3 class="text-lg font-semibold mb-4">Default</h3>
          <.tabs>
            <:tab active>Tab 1</:tab>
            <:tab>Tab 2</:tab>
            <:tab>Tab 3</:tab>
          </.tabs>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Boxed</h3>
          <.tabs variant="boxed">
            <:tab active>Tab 1</:tab>
            <:tab>Tab 2</:tab>
            <:tab disabled>Disabled</:tab>
          </.tabs>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Bordered</h3>
          <.tabs variant="bordered">
            <:tab active>Tab 1</:tab>
            <:tab>Tab 2</:tab>
            <:tab>Tab 3</:tab>
          </.tabs>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Lifted</h3>
          <.tabs variant="lifted">
            <:tab active>Tab 1</:tab>
            <:tab>Tab 2</:tab>
            <:tab>Tab 3</:tab>
          </.tabs>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">Sizes</h3>
          <div class="space-y-4">
            <.tabs size="xs">
              <:tab active>XS Tab</:tab>
              <:tab>Tab 2</:tab>
            </.tabs>
            <.tabs size="sm">
              <:tab active>SM Tab</:tab>
              <:tab>Tab 2</:tab>
            </.tabs>
            <.tabs size="md">
              <:tab active>MD Tab</:tab>
              <:tab>Tab 2</:tab>
            </.tabs>
            <.tabs size="lg">
              <:tab active>LG Tab</:tab>
              <:tab>Tab 2</:tab>
            </.tabs>
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
