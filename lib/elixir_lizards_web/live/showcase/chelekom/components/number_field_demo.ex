defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.NumberFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.NumberField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Number Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Numeric inputs with increment/decrement controls
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <NumberField.number_field
          name="quantity"
          value=""
          label="Quantity"
          placeholder="0"
          floating="outer"
        />
        <NumberField.number_field
          name="price"
          value=""
          label="Price"
          placeholder="0.00"
          description="Enter amount in USD"
          floating="outer"
        />
      </div>
    </div>
    """
  end
end
