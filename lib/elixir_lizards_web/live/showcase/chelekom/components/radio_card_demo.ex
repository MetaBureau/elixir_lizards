defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.RadioCardDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.RadioCard

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Radio Card</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Card-style radio selections for prominent single choices
        </p>
      </div>

      <div class="max-w-3xl mx-auto">
        <RadioCard.radio_card
          id="shipping-radio-card"
          name="shipping"
          color="primary"
          cols="3"
        >
          <:radio value="standard" title="Standard" description="5-7 business days"></:radio>
          <:radio value="express" title="Express" description="2-3 business days" checked></:radio>
          <:radio value="overnight" title="Overnight" description="Next business day"></:radio>
        </RadioCard.radio_card>
      </div>
    </div>
    """
  end
end
