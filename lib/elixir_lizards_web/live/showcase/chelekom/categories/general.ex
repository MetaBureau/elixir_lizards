defmodule ElixirLizardsWeb.Showcase.Chelekom.Categories.General do
  @moduledoc """
  General UI components: Accordion, Badge, Blockquote, Button, Card, Chat, Clipboard, Collapse,
  DeviceMockup, Divider, Icon, Indicator, Jumbotron, Keyboard, List, Rating, SpeedDial, Stepper,
  Table, TableContent, Tabs, Timeline, Typography
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    AccordionDemo,
    BadgeDemo,
    BlockquoteDemo,
    ButtonDemo,
    CardDemo,
    ChatDemo,
    ClipboardDemo,
    CollapseDemo,
    DeviceMockupDemo,
    DividerDemo,
    IconDemo,
    IndicatorDemo,
    JumbotronDemo,
    KeyboardDemo,
    ListDemo,
    RatingDemo,
    SpeedDialDemo,
    StepperDemo,
    TableDemo,
    TableContentDemo,
    TabsDemo,
    TimelineDemo,
    TypographyDemo
  }

  @components [
    %{name: "Accordion", module: AccordionDemo},
    %{name: "Badge", module: BadgeDemo},
    %{name: "Blockquote", module: BlockquoteDemo},
    %{name: "Button", module: ButtonDemo},
    %{name: "Card", module: CardDemo},
    %{name: "Chat", module: ChatDemo},
    %{name: "Clipboard", module: ClipboardDemo},
    %{name: "Collapse", module: CollapseDemo},
    %{name: "DeviceMockup", module: DeviceMockupDemo},
    %{name: "Divider", module: DividerDemo},
    %{name: "Icon", module: IconDemo},
    %{name: "Indicator", module: IndicatorDemo},
    %{name: "Jumbotron", module: JumbotronDemo},
    %{name: "Keyboard", module: KeyboardDemo},
    %{name: "List", module: ListDemo},
    %{name: "Rating", module: RatingDemo},
    %{name: "SpeedDial", module: SpeedDialDemo},
    %{name: "Stepper", module: StepperDemo},
    %{name: "Table", module: TableDemo},
    %{name: "TableContent", module: TableContentDemo},
    %{name: "Tabs", module: TabsDemo},
    %{name: "Timeline", module: TimelineDemo},
    %{name: "Typography", module: TypographyDemo}
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
