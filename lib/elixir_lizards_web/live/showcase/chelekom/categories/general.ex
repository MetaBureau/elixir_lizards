defmodule ElixirLizardsWeb.Showcase.Chelekom.Categories.General do
  @moduledoc """
  General UI components: Accordion, Badge, Button, Card, Collapse, Divider, Icon, Rating, Table, Tabs
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    AccordionDemo,
    BadgeDemo,
    ButtonDemo,
    CardDemo,
    CollapseDemo,
    DividerDemo,
    IconDemo,
    RatingDemo,
    TableDemo,
    TabsDemo
  }

  @components [
    %{name: "Accordion", module: AccordionDemo},
    %{name: "Badge", module: BadgeDemo},
    %{name: "Button", module: ButtonDemo},
    %{name: "Card", module: CardDemo},
    %{name: "Collapse", module: CollapseDemo},
    %{name: "Divider", module: DividerDemo},
    %{name: "Icon", module: IconDemo},
    %{name: "Rating", module: RatingDemo},
    %{name: "Table", module: TableDemo},
    %{name: "Tabs", module: TabsDemo}
  ]

  def components, do: @components

  def render(assigns) do
    assigns = assign(assigns, :components, @components)

    ~H"""
    <div class="space-y-16">
      <section :for={component <- @components}>
        <.live_component
          module={component.module}
          id={"#{String.downcase(component.name)}-demo"}
        />
      </section>
    </div>
    """
  end
end
