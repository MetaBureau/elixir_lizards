defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.CardDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Button, Card}

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Card</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Flexible content containers with titles, media, content, and footers
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <Card.card padding="medium" rounded="large">
          <Card.card_title title="Basic Card" icon="hero-document-text" />
          <Card.card_content>
            A simple card with title, icon, and content section.
          </Card.card_content>
        </Card.card>

        <Card.card padding="medium" rounded="large">
          <Card.card_title title="With Footer" icon="hero-chat-bubble-left" />
          <Card.card_content>
            Cards can include footer sections for actions.
          </Card.card_content>
          <Card.card_footer class="flex gap-2">
            <Button.button size="small">Action</Button.button>
            <Button.button size="small" variant="outline">Cancel</Button.button>
          </Card.card_footer>
        </Card.card>

        <Card.card variant="outline" color="success" padding="medium" rounded="large">
          <Card.card_title title="Outline Variant" icon="hero-check-circle" />
          <Card.card_content>
            Outline style with success color theme.
          </Card.card_content>
        </Card.card>
      </div>
    </div>
    """
  end
end
