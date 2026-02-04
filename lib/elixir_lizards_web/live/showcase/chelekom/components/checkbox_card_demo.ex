defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.CheckboxCardDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.CheckboxCard

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Checkbox Card</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Card-style checkbox selections for prominent choices
        </p>
      </div>

      <div class="max-w-3xl mx-auto">
        <CheckboxCard.checkbox_card
          name="features"
          color="primary"
          cols="3"
        >
          <:checkbox value="analytics" title="Analytics" description="Track user behavior" />
          <:checkbox value="notifications" title="Notifications" description="Push and email alerts" checked />
          <:checkbox value="integrations" title="Integrations" description="Third-party connections" />
        </CheckboxCard.checkbox_card>
      </div>
    </div>
    """
  end
end
