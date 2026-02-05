defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.AccordionDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Accordion

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Accordion</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Collapsible content sections for FAQs and expandable information
        </p>
      </div>

      <div class="max-w-2xl mx-auto">
        <Accordion.accordion id="chelekom-accordion" color="natural" rounded="medium">
          <:item
            id="chelekom-faq-1"
            title="What is Mishka Chelekom?"
            icon="hero-question-mark-circle"
            open
          >
            Mishka Chelekom is a zero-configuration UI component library for Phoenix LiveView.
          </:item>
          <:item id="chelekom-faq-2" title="How do I install components?" icon="hero-arrow-down-tray">
            Use the mix task: <code>mix mishka.ui.gen.component component_name</code>
          </:item>
          <:item id="chelekom-faq-3" title="Are components customizable?" icon="hero-paint-brush">
            Yes! Every component supports variants, colors, sizes, and custom CSS classes.
          </:item>
        </Accordion.accordion>
      </div>
    </div>
    """
  end
end
