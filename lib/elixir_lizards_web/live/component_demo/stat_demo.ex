defmodule ElixirLizardsWeb.ComponentDemo.StatDemo do
  @moduledoc """
  Demo for the stat and stat_group components.
  """
  use ElixirLizardsWeb, :live_view

  @code_example """
  <.stat_group>
    <.stat title="Downloads" value="31K" />
    <.stat 
      title="Revenue" 
      value="$12,500" 
      description="+12%" 
      icon="hero-currency-dollar"
      variant="success"
    />
  </.stat_group>
  """

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Stat Component")
     |> assign(:code_example, @code_example)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate="/dev/components">Components</:crumb>
        <:crumb>Stat</:crumb>
      </.breadcrumb>

      <.header>
        Stat
        <:subtitle>Display key metrics and statistics in a clean format.</:subtitle>
        <:actions>
          <.button navigate="/dev/components">Back to Components</.button>
        </:actions>
      </.header>

      <div class="space-y-8">
        <section>
          <h3 class="text-lg font-semibold mb-4">Basic Stats</h3>
          <.stat_group class="w-full">
            <.stat title="Total Users" value="31,245" />
            <.stat title="Page Views" value="2.6M" />
            <.stat title="Bounce Rate" value="21%" />
          </.stat_group>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">With Descriptions</h3>
          <.stat_group class="w-full">
            <.stat title="Total Users" value="31,245" description="+12% from last month" />
            <.stat title="Revenue" value="$12,500" description="Current month" />
            <.stat title="Tasks" value="86%" description="Completed" />
          </.stat_group>
        </section>

        <section>
          <h3 class="text-lg font-semibold mb-4">With Icons and Variants</h3>
          <.stat_group class="w-full">
            <.stat
              title="Revenue"
              value="$12,500"
              description="+22%"
              icon="hero-currency-dollar"
              variant="success"
            />
            <.stat
              title="Tasks"
              value="86%"
              description="Completed"
              icon="hero-check-circle"
              variant="info"
            />
            <.stat
              title="Issues"
              value="12"
              description="Open"
              icon="hero-exclamation-triangle"
              variant="warning"
            />
          </.stat_group>
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
