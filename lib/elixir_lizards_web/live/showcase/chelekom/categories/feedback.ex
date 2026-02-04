defmodule ElixirLizardsWeb.Showcase.Chelekom.Categories.Feedback do
  @moduledoc """
  Feedback components: Alert, Progress, Skeleton, Spinner
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    AlertDemo,
    ProgressDemo,
    SkeletonDemo,
    SpinnerDemo
  }

  @components [
    %{name: "Alert", module: AlertDemo},
    %{name: "Progress", module: ProgressDemo},
    %{name: "Skeleton", module: SkeletonDemo},
    %{name: "Spinner", module: SpinnerDemo}
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
