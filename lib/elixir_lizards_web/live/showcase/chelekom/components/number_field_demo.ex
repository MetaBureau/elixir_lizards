defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.NumberFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.NumberField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Number Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Numeric inputs with variants and increment controls
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Outline Variant</h3>
          <NumberField.number_field
            name="quantity"
            value=""
            label="Quantity"
            placeholder="0"
            floating="outer"
            variant="outline"
            color="primary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Description</h3>
          <NumberField.number_field
            name="price"
            value=""
            label="Price"
            placeholder="0.00"
            description="Enter amount in USD"
            floating="outer"
            variant="outline"
            color="natural"
          >
            <:start_section>
              <span class="text-base-content/60">$</span>
            </:start_section>
          </NumberField.number_field>
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Shadow Variant</h3>
          <NumberField.number_field
            name="age"
            value=""
            label="Age"
            placeholder="18"
            floating="outer"
            variant="shadow"
            color="secondary"
          />
        </div>
      </div>
    </div>
    """
  end
end
