defmodule ElixirLizardsWeb.Components.DaisyUI.Avatar do
  @moduledoc """
  Avatar component with DaisyUI styling.
  """
  use Phoenix.Component
  import ElixirLizardsWeb.Components.DaisyUI.Icon, only: [icon: 1]

  @doc """
  Renders an avatar component.

  ## Examples

      <.avatar src="/images/user.jpg" alt="John Doe" />
      <.avatar placeholder="JD" />
      <.avatar src="/images/user.jpg" size="lg" status="online" />
      <.avatar src="/images/user.jpg" shape="squircle" />
  """
  attr :src, :string, default: nil, doc: "the image source URL"
  attr :alt, :string, default: "", doc: "alt text for the image"
  attr :placeholder, :string, default: nil, doc: "text to show when no image (e.g., initials)"
  attr :size, :string, default: "md", values: ["xs", "sm", "md", "lg", "xl"]
  attr :shape, :string, default: "circle", values: ["circle", "squircle", "hexagon", "triangle"]
  attr :status, :string, default: nil, values: [nil, "online", "offline"]
  attr :class, :any, default: nil
  attr :rest, :global

  def avatar(assigns) do
    size_classes = %{
      "xs" => "w-8",
      "sm" => "w-12",
      "md" => "w-16",
      "lg" => "w-20",
      "xl" => "w-24"
    }

    placeholder_text_sizes = %{
      "xs" => "text-xs",
      "sm" => "text-sm",
      "md" => "text-base",
      "lg" => "text-xl",
      "xl" => "text-2xl"
    }

    icon_sizes = %{
      "xs" => "size-4",
      "sm" => "size-6",
      "md" => "size-8",
      "lg" => "size-10",
      "xl" => "size-12"
    }

    assigns =
      assigns
      |> assign(:size_class, Map.get(size_classes, assigns.size, "w-16"))
      |> assign(:text_size, Map.get(placeholder_text_sizes, assigns.size, "text-base"))
      |> assign(:icon_size, Map.get(icon_sizes, assigns.size, "size-8"))

    ~H"""
    <div class={["avatar", @status, @class]} {@rest}>
      <div class={[
        @size_class,
        @shape == "circle" && "rounded-full",
        @shape == "squircle" && "mask mask-squircle",
        @shape == "hexagon" && "mask mask-hexagon",
        @shape == "triangle" && "mask mask-triangle"
      ]}>
        <img :if={@src} src={@src} alt={@alt} />
        <div
          :if={!@src && @placeholder}
          class={[
            "bg-neutral text-neutral-content flex items-center justify-center w-full h-full",
            @text_size
          ]}
        >
          <span>{@placeholder}</span>
        </div>
        <div
          :if={!@src && !@placeholder}
          class="bg-neutral text-neutral-content flex items-center justify-center w-full h-full"
        >
          <.icon name="hero-user" class={@icon_size} />
        </div>
      </div>
    </div>
    """
  end
end
