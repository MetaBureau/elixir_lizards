defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.NativeSelectDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.NativeSelect

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Native Select</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Native dropdown select inputs with styling options
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <NativeSelect.native_select
          name="country"
          label="Country"
          color="natural"
        >
          <:option value="us">United States</:option>
          <:option value="uk">United Kingdom</:option>
          <:option value="ca">Canada</:option>
          <:option value="au">Australia</:option>
        </NativeSelect.native_select>

        <NativeSelect.native_select
          name="priority"
          label="Priority"
          color="primary"
        >
          <:option value="low">Low</:option>
          <:option value="medium" selected>Medium</:option>
          <:option value="high">High</:option>
        </NativeSelect.native_select>
      </div>
    </div>
    """
  end
end
