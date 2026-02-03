defmodule ElixirLizardsWeb.CoreComponents do
  @moduledoc """
  Provides core UI components.

  At first glance, this module may seem daunting, but its goal is to provide
  core building blocks for your application, such as tables, forms, and
  inputs. The components consist mostly of markup and are well-documented
  with doc strings and declarative assigns. You may customize and style
  them in any way you want, based on your application growth and needs.

  The foundation for styling is Tailwind CSS, a utility-first CSS framework,
  augmented with daisyUI, a Tailwind CSS plugin that provides UI components
  and themes. Here are useful references:

    * [daisyUI](https://daisyui.com/docs/intro/) - a good place to get
      started and see the available components.

    * [Tailwind CSS](https://tailwindcss.com) - the foundational framework
      we build on. You will use it for layout, sizing, flexbox, grid, and
      spacing.

    * [Heroicons](https://heroicons.com) - see `icon/1` for usage.

    * [Phoenix.Component](https://hexdocs.pm/phoenix_live_view/Phoenix.Component.html) -
      the component system used by Phoenix. Some components, such as `<.link>`
      and `<.form>`, are defined there.

  """
  use Phoenix.Component
  use Gettext, backend: ElixirLizardsWeb.Gettext

  alias Phoenix.LiveView.JS

  @doc """
  Renders flash notices.

  ## Examples

      <.flash kind={:info} flash={@flash} />
      <.flash kind={:info} phx-mounted={show("#flash")}>Welcome Back!</.flash>
  """
  attr :id, :string, doc: "the optional id of flash container"
  attr :flash, :map, default: %{}, doc: "the map of flash messages to display"
  attr :title, :string, default: nil
  attr :kind, :atom, values: [:info, :error], doc: "used for styling and flash lookup"
  attr :rest, :global, doc: "the arbitrary HTML attributes to add to the flash container"

  slot :inner_block, doc: "the optional inner block that renders the flash message"

  def flash(assigns) do
    assigns = assign_new(assigns, :id, fn -> "flash-#{assigns.kind}" end)

    ~H"""
    <div
      :if={msg = render_slot(@inner_block) || Phoenix.Flash.get(@flash, @kind)}
      id={@id}
      phx-click={JS.push("lv:clear-flash", value: %{key: @kind}) |> hide("##{@id}")}
      role="alert"
      class="toast toast-top toast-end z-50"
      {@rest}
    >
      <div class={[
        "alert w-80 sm:w-96 max-w-80 sm:max-w-96 text-wrap",
        @kind == :info && "alert-info",
        @kind == :error && "alert-error"
      ]}>
        <.icon :if={@kind == :info} name="hero-information-circle" class="size-5 shrink-0" />
        <.icon :if={@kind == :error} name="hero-exclamation-circle" class="size-5 shrink-0" />
        <div>
          <p :if={@title} class="font-semibold">{@title}</p>
          <p>{msg}</p>
        </div>
        <div class="flex-1" />
        <button type="button" class="group self-start cursor-pointer" aria-label={gettext("close")}>
          <.icon name="hero-x-mark" class="size-5 opacity-40 group-hover:opacity-70" />
        </button>
      </div>
    </div>
    """
  end

  @doc """
  Renders a button with navigation support.

  ## Examples

      <.button>Send!</.button>
      <.button phx-click="go" variant="primary">Send!</.button>
      <.button navigate={~p"/"}>Home</.button>
  """
  attr :rest, :global, include: ~w(href navigate patch method download name value disabled)
  attr :class, :any
  attr :variant, :string, values: ~w(primary)
  slot :inner_block, required: true

  def button(%{rest: rest} = assigns) do
    variants = %{"primary" => "btn-primary", nil => "btn-primary btn-soft"}

    assigns =
      assign_new(assigns, :class, fn ->
        ["btn", Map.fetch!(variants, assigns[:variant])]
      end)

    if rest[:href] || rest[:navigate] || rest[:patch] do
      ~H"""
      <.link class={@class} {@rest}>
        {render_slot(@inner_block)}
      </.link>
      """
    else
      ~H"""
      <button class={@class} {@rest}>
        {render_slot(@inner_block)}
      </button>
      """
    end
  end

  @doc """
  Renders an input with label and error messages.

  A `Phoenix.HTML.FormField` may be passed as argument,
  which is used to retrieve the input name, id, and values.
  Otherwise all attributes may be passed explicitly.

  ## Types

  This function accepts all HTML input types, considering that:

    * You may also set `type="select"` to render a `<select>` tag

    * `type="checkbox"` is used exclusively to render boolean values

    * For live file uploads, see `Phoenix.Component.live_file_input/1`

  See https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input
  for more information. Unsupported types, such as radio, are best
  written directly in your templates.

  ## Examples

  ```heex
  <.input field={@form[:email]} type="email" />
  <.input name="my-input" errors={["oh no!"]} />
  ```

  ## Select type

  When using `type="select"`, you must pass the `options` and optionally
  a `value` to mark which option should be preselected.

  ```heex
  <.input field={@form[:user_type]} type="select" options={["Admin": "admin", "User": "user"]} />
  ```

  For more information on what kind of data can be passed to `options` see
  [`options_for_select`](https://hexdocs.pm/phoenix_html/Phoenix.HTML.Form.html#options_for_select/2).
  """
  attr :id, :any, default: nil
  attr :name, :any
  attr :label, :string, default: nil
  attr :value, :any

  attr :type, :string,
    default: "text",
    values: ~w(checkbox color date datetime-local email file month number password
               search select tel text textarea time url week hidden)

  attr :field, Phoenix.HTML.FormField,
    doc: "a form field struct retrieved from the form, for example: @form[:email]"

  attr :errors, :list, default: []
  attr :checked, :boolean, doc: "the checked flag for checkbox inputs"
  attr :prompt, :string, default: nil, doc: "the prompt for select inputs"
  attr :options, :list, doc: "the options to pass to Phoenix.HTML.Form.options_for_select/2"
  attr :multiple, :boolean, default: false, doc: "the multiple flag for select inputs"
  attr :class, :any, default: nil, doc: "the input class to use over defaults"
  attr :error_class, :any, default: nil, doc: "the input error class to use over defaults"

  attr :rest, :global,
    include: ~w(accept autocomplete capture cols disabled form list max maxlength min minlength
                multiple pattern placeholder readonly required rows size step)

  def input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
    errors = if Phoenix.Component.used_input?(field), do: field.errors, else: []

    assigns
    |> assign(field: nil, id: assigns.id || field.id)
    |> assign(:errors, Enum.map(errors, &translate_error(&1)))
    |> assign_new(:name, fn -> if assigns.multiple, do: field.name <> "[]", else: field.name end)
    |> assign_new(:value, fn -> field.value end)
    |> input()
  end

  def input(%{type: "hidden"} = assigns) do
    ~H"""
    <input type="hidden" id={@id} name={@name} value={@value} {@rest} />
    """
  end

  def input(%{type: "checkbox"} = assigns) do
    assigns =
      assign_new(assigns, :checked, fn ->
        Phoenix.HTML.Form.normalize_value("checkbox", assigns[:value])
      end)

    ~H"""
    <div class="fieldset mb-2">
      <label>
        <input
          type="hidden"
          name={@name}
          value="false"
          disabled={@rest[:disabled]}
          form={@rest[:form]}
        />
        <span class="label">
          <input
            type="checkbox"
            id={@id}
            name={@name}
            value="true"
            checked={@checked}
            class={@class || "checkbox checkbox-sm"}
            {@rest}
          />{@label}
        </span>
      </label>
      <.error :for={msg <- @errors}>{msg}</.error>
    </div>
    """
  end

  def input(%{type: "select"} = assigns) do
    ~H"""
    <div class="fieldset mb-2">
      <label>
        <span :if={@label} class="label mb-1">{@label}</span>
        <select
          id={@id}
          name={@name}
          class={[@class || "w-full select", @errors != [] && (@error_class || "select-error")]}
          multiple={@multiple}
          {@rest}
        >
          <option :if={@prompt} value="">{@prompt}</option>
          {Phoenix.HTML.Form.options_for_select(@options, @value)}
        </select>
      </label>
      <.error :for={msg <- @errors}>{msg}</.error>
    </div>
    """
  end

  def input(%{type: "textarea"} = assigns) do
    ~H"""
    <div class="fieldset mb-2">
      <label>
        <span :if={@label} class="label mb-1">{@label}</span>
        <textarea
          id={@id}
          name={@name}
          class={[
            @class || "w-full textarea",
            @errors != [] && (@error_class || "textarea-error")
          ]}
          {@rest}
        >{Phoenix.HTML.Form.normalize_value("textarea", @value)}</textarea>
      </label>
      <.error :for={msg <- @errors}>{msg}</.error>
    </div>
    """
  end

  # All other inputs text, datetime-local, url, password, etc. are handled here...
  def input(assigns) do
    ~H"""
    <div class="fieldset mb-2">
      <label>
        <span :if={@label} class="label mb-1">{@label}</span>
        <input
          type={@type}
          name={@name}
          id={@id}
          value={Phoenix.HTML.Form.normalize_value(@type, @value)}
          class={[
            @class || "w-full input",
            @errors != [] && (@error_class || "input-error")
          ]}
          {@rest}
        />
      </label>
      <.error :for={msg <- @errors}>{msg}</.error>
    </div>
    """
  end

  # Helper used by inputs to generate form errors
  defp error(assigns) do
    ~H"""
    <p class="mt-1.5 flex gap-2 items-center text-sm text-error">
      <.icon name="hero-exclamation-circle" class="size-5" />
      {render_slot(@inner_block)}
    </p>
    """
  end

  @doc """
  Renders a header with title.
  """
  slot :inner_block, required: true
  slot :subtitle
  slot :actions

  def header(assigns) do
    ~H"""
    <header class={[@actions != [] && "flex items-center justify-between gap-6", "pb-4"]}>
      <div>
        <h1 class="text-lg font-semibold leading-8">
          {render_slot(@inner_block)}
        </h1>
        <p :if={@subtitle != []} class="text-sm text-base-content/70">
          {render_slot(@subtitle)}
        </p>
      </div>
      <div class="flex-none">{render_slot(@actions)}</div>
    </header>
    """
  end

  @doc """
  Renders a table with generic styling.

  ## Examples

      <.table id="users" rows={@users}>
        <:col :let={user} label="id">{user.id}</:col>
        <:col :let={user} label="username">{user.username}</:col>
      </.table>
  """
  attr :id, :string, required: true
  attr :rows, :list, required: true
  attr :row_id, :any, default: nil, doc: "the function for generating the row id"
  attr :row_click, :any, default: nil, doc: "the function for handling phx-click on each row"

  attr :row_item, :any,
    default: &Function.identity/1,
    doc: "the function for mapping each row before calling the :col and :action slots"

  slot :col, required: true do
    attr :label, :string
  end

  slot :action, doc: "the slot for showing user actions in the last table column"

  def table(assigns) do
    assigns =
      with %{rows: %Phoenix.LiveView.LiveStream{}} <- assigns do
        assign(assigns, row_id: assigns.row_id || fn {id, _item} -> id end)
      end

    ~H"""
    <table class="table table-zebra">
      <thead>
        <tr>
          <th :for={col <- @col}>{col[:label]}</th>
          <th :if={@action != []}>
            <span class="sr-only">{gettext("Actions")}</span>
          </th>
        </tr>
      </thead>
      <tbody id={@id} phx-update={is_struct(@rows, Phoenix.LiveView.LiveStream) && "stream"}>
        <tr :for={row <- @rows} id={@row_id && @row_id.(row)}>
          <td
            :for={col <- @col}
            phx-click={@row_click && @row_click.(row)}
            class={@row_click && "hover:cursor-pointer"}
          >
            {render_slot(col, @row_item.(row))}
          </td>
          <td :if={@action != []} class="w-0 font-semibold">
            <div class="flex gap-4">
              <%= for action <- @action do %>
                {render_slot(action, @row_item.(row))}
              <% end %>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    """
  end

  @doc """
  Renders a data list.

  ## Examples

      <.list>
        <:item title="Title">{@post.title}</:item>
        <:item title="Views">{@post.views}</:item>
      </.list>
  """
  slot :item, required: true do
    attr :title, :string, required: true
  end

  def list(assigns) do
    ~H"""
    <ul class="list">
      <li :for={item <- @item} class="list-row">
        <div class="list-col-grow">
          <div class="font-bold">{item.title}</div>
          <div>{render_slot(item)}</div>
        </div>
      </li>
    </ul>
    """
  end

  @doc """
  Renders a [Heroicon](https://heroicons.com).

  Heroicons come in three styles – outline, solid, and mini.
  By default, the outline style is used, but solid and mini may
  be applied by using the `-solid` and `-mini` suffix.

  You can customize the size and colors of the icons by setting
  width, height, and background color classes.

  Icons are extracted from the `deps/heroicons` directory and bundled within
  your compiled app.css by the plugin in `assets/vendor/heroicons.js`.

  ## Examples

      <.icon name="hero-x-mark" />
      <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
  """
  attr :name, :string, required: true
  attr :class, :any, default: "size-4"

  def icon(%{name: "hero-" <> _} = assigns) do
    ~H"""
    <span class={[@name, @class]} />
    """
  end

  @doc """
  Renders a modal dialog.

  ## Examples

      <.modal id="confirm-modal" on_cancel={JS.navigate(~p"/")}>
        <:title>Confirm Action</:title>
        <p>Are you sure you want to proceed?</p>
        <:actions>
          <.button phx-click="confirm">Yes</.button>
        </:actions>
      </.modal>

  To show the modal, use `show_modal/1`. To hide it, use `hide_modal/1`.

      <.button phx-click={show_modal("confirm-modal")}>Open</.button>
  """
  attr :id, :string, required: true
  attr :on_cancel, JS, default: %JS{}
  attr :class, :any, default: nil

  slot :inner_block, required: true
  slot :title
  slot :subtitle
  slot :actions

  def modal(assigns) do
    ~H"""
    <dialog
      id={@id}
      class="modal"
      phx-mounted={JS.set_attribute({"open", "true"}, to: "##{@id}")}
      data-cancel={JS.exec(@on_cancel, "phx-remove")}
    >
      <div class={["modal-box", @class]}>
        <form method="dialog">
          <button
            type="button"
            class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
            aria-label={gettext("close")}
            phx-click={hide_modal(@id) |> JS.exec("data-cancel", to: "##{@id}")}
          >
            <.icon name="hero-x-mark" class="size-5" />
          </button>
        </form>
        <h3 :if={@title != []} class="font-bold text-lg">
          {render_slot(@title)}
        </h3>
        <p :if={@subtitle != []} class="text-sm text-base-content/70">
          {render_slot(@subtitle)}
        </p>
        <div class="py-4">
          {render_slot(@inner_block)}
        </div>
        <div :if={@actions != []} class="modal-action">
          {render_slot(@actions)}
        </div>
      </div>
      <form method="dialog" class="modal-backdrop">
        <button type="button" phx-click={hide_modal(@id) |> JS.exec("data-cancel", to: "##{@id}")}>
          close
        </button>
      </form>
    </dialog>
    """
  end

  @doc """
  Shows a modal by ID.

  ## Examples

      <.button phx-click={show_modal("my-modal")}>Open Modal</.button>
  """
  def show_modal(js \\ %JS{}, id) when is_binary(id) do
    js
    |> JS.set_attribute({"open", "true"}, to: "##{id}")
    |> JS.focus_first(to: "##{id} .modal-box")
  end

  @doc """
  Hides a modal by ID.

  ## Examples

      <.button phx-click={hide_modal("my-modal")}>Close</.button>
  """
  def hide_modal(js \\ %JS{}, id) when is_binary(id) do
    js
    |> JS.remove_attribute("open", to: "##{id}")
  end

  @doc """
  Renders a card component.

  ## Examples

      <.card>
        <:title>Card Title</:title>
        <:body>This is the card content.</:body>
      </.card>

      <.card variant="bordered">
        <:figure><img src="/images/photo.jpg" alt="Photo" /></:figure>
        <:title>Photo Card</:title>
        <:body>A card with an image.</:body>
        <:actions><.button>View</.button></:actions>
      </.card>
  """
  attr :class, :any, default: nil
  attr :variant, :string, default: nil, values: [nil, "bordered", "compact"]

  slot :figure, doc: "optional image or media at the top of the card"
  slot :title, doc: "the card title"
  slot :body, doc: "the main card content"
  slot :actions, doc: "action buttons at the bottom of the card"

  def card(assigns) do
    ~H"""
    <div class={[
      "card bg-base-100",
      @variant == "bordered" && "card-border border-base-300",
      @variant == "compact" && "card-compact",
      @class
    ]}>
      <figure :if={@figure != []}>
        {render_slot(@figure)}
      </figure>
      <div class="card-body">
        <h2 :if={@title != []} class="card-title">
          {render_slot(@title)}
        </h2>
        <div :if={@body != []}>
          {render_slot(@body)}
        </div>
        <div :if={@actions != []} class="card-actions justify-end">
          {render_slot(@actions)}
        </div>
      </div>
    </div>
    """
  end

  @doc """
  Renders a badge component.

  ## Examples

      <.badge>Default</.badge>
      <.badge variant="primary">Primary</.badge>
      <.badge variant="success">Active</.badge>
      <.badge variant="error" size="lg">Critical</.badge>
      <.badge outline>Outlined</.badge>
  """
  attr :variant, :string,
    default: nil,
    values: [
      nil,
      "primary",
      "secondary",
      "accent",
      "info",
      "success",
      "warning",
      "error",
      "ghost"
    ]

  attr :size, :string, default: nil, values: [nil, "xs", "sm", "md", "lg"]
  attr :outline, :boolean, default: false
  attr :class, :any, default: nil
  attr :rest, :global

  slot :inner_block, required: true

  def badge(assigns) do
    ~H"""
    <span
      class={[
        "badge",
        @variant && "badge-#{@variant}",
        @size && "badge-#{@size}",
        @outline && "badge-outline",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </span>
    """
  end

  @doc """
  Renders a dropdown menu.

  ## Examples

      <.dropdown>
        <:trigger>
          <.button>Options</.button>
        </:trigger>
        <:item>Profile</:item>
        <:item>Settings</:item>
        <:item navigate={~p"/logout"}>Logout</:item>
      </.dropdown>

      <.dropdown position="end">
        <:trigger><.button>Menu</.button></:trigger>
        <:item phx-click="action">Action</:item>
      </.dropdown>
  """
  attr :class, :any, default: nil
  attr :position, :string, default: nil, values: [nil, "end", "top", "left", "right"]
  attr :hover, :boolean, default: false, doc: "open on hover instead of click"

  slot :trigger, required: true, doc: "the element that triggers the dropdown"

  slot :item, doc: "menu items" do
    attr :navigate, :string
    attr :patch, :string
    attr :href, :string
  end

  def dropdown(assigns) do
    ~H"""
    <div class={[
      "dropdown",
      @position && "dropdown-#{@position}",
      @hover && "dropdown-hover",
      @class
    ]}>
      <div tabindex="0" role="button">
        {render_slot(@trigger)}
      </div>
      <ul tabindex="0" class="dropdown-content menu bg-base-100 rounded-box z-10 w-52 p-2 shadow-lg">
        <li :for={item <- @item}>
          <.link
            :if={item[:navigate] || item[:patch] || item[:href]}
            navigate={item[:navigate]}
            patch={item[:patch]}
            href={item[:href]}
          >
            {render_slot(item)}
          </.link>
          <a :if={!item[:navigate] && !item[:patch] && !item[:href]}>
            {render_slot(item)}
          </a>
        </li>
      </ul>
    </div>
    """
  end

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

    assigns =
      assigns
      |> assign(:size_class, Map.get(size_classes, assigns.size, "w-16"))
      |> assign(:text_size, Map.get(placeholder_text_sizes, assigns.size, "text-base"))

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
          <.icon name="hero-user" class={@size_class} />
        </div>
      </div>
    </div>
    """
  end

  @doc """
  Renders a group of stat components.

  ## Examples

      <.stat_group>
        <.stat title="Total Users" value="31,245" />
        <.stat title="Revenue" value="$12,500" description="+12% from last month" />
      </.stat_group>
  """
  attr :class, :any, default: nil

  slot :inner_block, required: true

  def stat_group(assigns) do
    ~H"""
    <div class={["stats shadow", @class]}>
      {render_slot(@inner_block)}
    </div>
    """
  end

  @doc """
  Renders a single stat component.

  ## Examples

      <.stat title="Downloads" value="31K" />
      <.stat title="Revenue" value="$12,500" description="+12%" icon="hero-currency-dollar" />
      <.stat title="Tasks" value="86%" description="Completed" variant="info" />
  """
  attr :title, :string, required: true
  attr :value, :string, required: true
  attr :description, :string, default: nil
  attr :icon, :string, default: nil

  attr :variant, :string,
    default: nil,
    values: [nil, "primary", "secondary", "accent", "info", "success", "warning", "error"]

  attr :class, :any, default: nil

  def stat(assigns) do
    ~H"""
    <div class={["stat", @class]}>
      <div :if={@icon} class={["stat-figure", @variant && "text-#{@variant}"]}>
        <.icon name={@icon} class="size-8" />
      </div>
      <div class="stat-title">{@title}</div>
      <div class={["stat-value", @variant && "text-#{@variant}"]}>{@value}</div>
      <div :if={@description} class="stat-desc">{@description}</div>
    </div>
    """
  end

  @doc """
  Renders an empty state placeholder for collections.

  ## Examples

      <.empty_state title="No documents">
        <:description>Get started by creating your first document.</:description>
        <:action><.button>Create Document</.button></:action>
      </.empty_state>

      <.empty_state icon="hero-inbox" title="No messages">
        <:description>Your inbox is empty.</:description>
      </.empty_state>
  """
  attr :icon, :string, default: "hero-folder-open"
  attr :title, :string, required: true
  attr :class, :any, default: nil

  slot :description
  slot :action

  def empty_state(assigns) do
    ~H"""
    <div class={["flex flex-col items-center justify-center py-12 px-4 text-center", @class]}>
      <div class="rounded-full bg-base-200 p-4 mb-4">
        <.icon name={@icon} class="size-12 text-base-content/50" />
      </div>
      <h3 class="text-lg font-semibold text-base-content mb-2">{@title}</h3>
      <p :if={@description != []} class="text-sm text-base-content/70 mb-4 max-w-sm">
        {render_slot(@description)}
      </p>
      <div :if={@action != []}>
        {render_slot(@action)}
      </div>
    </div>
    """
  end

  @doc """
  Renders a tabs component.

  ## Examples

      <.tabs>
        <:tab active>All Users</:tab>
        <:tab>Active</:tab>
        <:tab>Inactive</:tab>
      </.tabs>

      <.tabs variant="boxed">
        <:tab patch={~p"/users?tab=all"} active={@tab == "all"}>All</:tab>
        <:tab patch={~p"/users?tab=active"} active={@tab == "active"}>Active</:tab>
      </.tabs>
  """
  attr :variant, :string, default: nil, values: [nil, "boxed", "bordered", "lifted"]
  attr :size, :string, default: nil, values: [nil, "xs", "sm", "md", "lg"]
  attr :class, :any, default: nil

  slot :tab, required: true do
    attr :active, :boolean
    attr :disabled, :boolean
    attr :navigate, :string
    attr :patch, :string
    attr :href, :string
  end

  def tabs(assigns) do
    ~H"""
    <div
      role="tablist"
      class={[
        "tabs",
        @variant && "tabs-#{@variant}",
        @size && "tabs-#{@size}",
        @class
      ]}
    >
      <%= for tab <- @tab do %>
        <.link
          :if={tab[:navigate] || tab[:patch] || tab[:href]}
          navigate={tab[:navigate]}
          patch={tab[:patch]}
          href={tab[:href]}
          role="tab"
          class={[
            "tab",
            tab[:active] && "tab-active",
            tab[:disabled] && "tab-disabled"
          ]}
        >
          {render_slot(tab)}
        </.link>
        <a
          :if={!tab[:navigate] && !tab[:patch] && !tab[:href]}
          role="tab"
          class={[
            "tab",
            tab[:active] && "tab-active",
            tab[:disabled] && "tab-disabled"
          ]}
        >
          {render_slot(tab)}
        </a>
      <% end %>
    </div>
    """
  end

  @doc """
  Renders a breadcrumb navigation component.

  ## Examples

      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb navigate={~p"/users"}>Users</:crumb>
        <:crumb>Edit User</:crumb>
      </.breadcrumb>
  """
  attr :class, :any, default: nil

  slot :crumb, required: true do
    attr :navigate, :string
    attr :patch, :string
    attr :href, :string
  end

  def breadcrumb(assigns) do
    ~H"""
    <div class={["breadcrumbs text-sm", @class]}>
      <ul>
        <li :for={crumb <- @crumb}>
          <.link
            :if={crumb[:navigate] || crumb[:patch] || crumb[:href]}
            navigate={crumb[:navigate]}
            patch={crumb[:patch]}
            href={crumb[:href]}
          >
            {render_slot(crumb)}
          </.link>
          <span :if={!crumb[:navigate] && !crumb[:patch] && !crumb[:href]}>
            {render_slot(crumb)}
          </span>
        </li>
      </ul>
    </div>
    """
  end

  @doc """
  Renders a tooltip component.

  ## Examples

      <.tooltip content="More information here">
        <.icon name="hero-question-mark-circle" />
      </.tooltip>

      <.tooltip content="Click to save" position="bottom">
        <.button>Save</.button>
      </.tooltip>
  """
  attr :content, :string, required: true
  attr :position, :string, default: nil, values: [nil, "top", "bottom", "left", "right"]

  attr :variant, :string,
    default: nil,
    values: [nil, "primary", "secondary", "accent", "info", "success", "warning", "error"]

  attr :open, :boolean, default: false, doc: "force the tooltip to be open"
  attr :class, :any, default: nil

  slot :inner_block, required: true

  def tooltip(assigns) do
    ~H"""
    <div
      class={[
        "tooltip",
        @position && "tooltip-#{@position}",
        @variant && "tooltip-#{@variant}",
        @open && "tooltip-open",
        @class
      ]}
      data-tip={@content}
    >
      {render_slot(@inner_block)}
    </div>
    """
  end

  ## JS Commands

  def show(js \\ %JS{}, selector) do
    JS.show(js,
      to: selector,
      time: 300,
      transition:
        {"transition-all ease-out duration-300",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95",
         "opacity-100 translate-y-0 sm:scale-100"}
    )
  end

  def hide(js \\ %JS{}, selector) do
    JS.hide(js,
      to: selector,
      time: 200,
      transition:
        {"transition-all ease-in duration-200", "opacity-100 translate-y-0 sm:scale-100",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"}
    )
  end

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, opts}) do
    # When using gettext, we typically pass the strings we want
    # to translate as a static argument:
    #
    #     # Translate the number of files with plural rules
    #     dngettext("errors", "1 file", "%{count} files", count)
    #
    # However the error messages in our forms and APIs are generated
    # dynamically, so we need to translate them by calling Gettext
    # with our gettext backend as first argument. Translations are
    # available in the errors.po file (as we use the "errors" domain).
    if count = opts[:count] do
      Gettext.dngettext(ElixirLizardsWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(ElixirLizardsWeb.Gettext, "errors", msg, opts)
    end
  end

  @doc """
  Translates the errors for a field from a keyword list of errors.
  """
  def translate_errors(errors, field) when is_list(errors) do
    for {^field, {msg, opts}} <- errors, do: translate_error({msg, opts})
  end
end
