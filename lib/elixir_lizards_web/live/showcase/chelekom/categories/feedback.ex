defmodule ElixirLizardsWeb.Showcase.Chelekom.Categories.Feedback do
  @moduledoc """
  Feedback components: Alert, Banner, Progress, Skeleton, Spinner, Toast
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Showcase.Chelekom.Components.{
    AlertDemo,
    BannerDemo,
    ProgressDemo,
    SkeletonDemo,
    SpinnerDemo,
    ToastDemo
  }

  @components [
    %{name: "Alert", module: AlertDemo},
    %{name: "Banner", module: BannerDemo},
    %{name: "Progress", module: ProgressDemo},
    %{name: "Skeleton", module: SkeletonDemo},
    %{name: "Spinner", module: SpinnerDemo},
    %{name: "Toast", module: ToastDemo}
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
