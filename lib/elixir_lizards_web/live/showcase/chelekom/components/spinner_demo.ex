defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.SpinnerDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Spinner

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Spinner</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Loading indicators with multiple animation styles
        </p>
      </div>

      <div class="space-y-6">
        <div>
          <h3 class="text-lg font-semibold mb-3 text-center">Sizes</h3>
          <div class="flex flex-wrap gap-6 justify-center items-center">
            <Spinner.spinner size="extra_small" color="primary" />
            <Spinner.spinner size="small" color="secondary" />
            <Spinner.spinner size="medium" color="success" />
            <Spinner.spinner size="large" color="warning" />
          </div>
        </div>
        <div>
          <h3 class="text-lg font-semibold mb-3 text-center">Animation Types</h3>
          <div class="flex flex-wrap gap-8 justify-center items-center">
            <div class="text-center">
              <Spinner.spinner type="default" size="large" color="primary" />
              <p class="text-sm mt-2">Default</p>
            </div>
            <div class="text-center">
              <Spinner.spinner type="dots" size="large" color="secondary" />
              <p class="text-sm mt-2">Dots</p>
            </div>
            <div class="text-center">
              <Spinner.spinner type="bars" size="large" color="success" />
              <p class="text-sm mt-2">Bars</p>
            </div>
            <div class="text-center">
              <Spinner.spinner type="pinging" size="large" color="warning" />
              <p class="text-sm mt-2">Pinging</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
