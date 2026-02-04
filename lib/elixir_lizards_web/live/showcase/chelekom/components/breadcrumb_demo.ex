defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.BreadcrumbDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Breadcrumb

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Breadcrumb</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Navigation trails showing the current page location
        </p>
      </div>

      <div class="space-y-4 flex flex-col items-center">
        <Breadcrumb.breadcrumb>
          <:item icon="hero-home" link="/">Home</:item>
          <:item link="/dev">Development</:item>
          <:item>Chelekom</:item>
        </Breadcrumb.breadcrumb>

        <Breadcrumb.breadcrumb color="primary" size="medium">
          <:item icon="hero-folder">Projects</:item>
          <:item icon="hero-document">Documentation</:item>
          <:item icon="hero-code-bracket">Components</:item>
        </Breadcrumb.breadcrumb>
      </div>
    </div>
    """
  end
end
