# Phoenix Component Development Guide

Best practices and patterns from the official Phoenix documentation and learnings from building DaisyUI components for this Phoenix/Ash application.

## Official Phoenix Component Patterns

### Attribute Declaration Best Practices

Always declare attributes with proper types using `attr/3`:

```elixir
# Basic types
attr :name, :string, required: true
attr :count, :integer, default: 0
attr :active, :boolean, default: false

# Constrained values (compile-time validation)
attr :size, :string, values: ["sm", "md", "lg"]

# With documentation
attr :variant, :string, default: nil, doc: "Visual style variant"
```

Supported types: `:any`, `:string`, `:atom`, `:boolean`, `:integer`, `:float`, `:list`, `:map`, `:fun`, `{:fun, arity}`, `:global`, or a struct module.

### Global Attributes Pattern

Use `:global` for accepting arbitrary HTML attributes:

```elixir
attr :class, :string, default: nil
attr :rest, :global, include: ~w(form disabled)

def button(assigns) do
  ~H"""
  <button class={["btn", @class]} {@rest}>
    {render_slot(@inner_block)}
  </button>
  """
end
```

The `:include` option adds specific attributes beyond the default HTML globals.

### Slot Declaration Best Practices

```elixir
# Required slot
slot :inner_block, required: true

# Optional slot with attributes
slot :header do
  attr :class, :string
end

# In template - provide fallback for optional slots
{render_slot(@header) || "Default Header"}
```

### Slot with Let (Yielding Values)

Pass values back to the caller using `:let`:

```elixir
slot :col do
  attr :label, :string, required: true
end
attr :rows, :list, required: true

def table(assigns) do
  ~H"""
  <table>
    <tr :for={row <- @rows}>
      <td :for={col <- @col}>
        {render_slot(col, row)}
      </td>
    </tr>
  </table>
  """
end
```

Usage:
```elixir
<.table rows={@users}>
  <:col :let={user} label="Name">{user.name}</:col>
</.table>
```

### Used Input Filtering

Filter form errors based on user interaction with `used_input?/1`:

```elixir
<.error :for={msg <- @errors} :if={used_input?(@field)}>
  {msg}
</.error>
```

This prevents showing "field can't be blank" before the user has interacted with the field.

### Lazy Assigns with assign_new/3

Use `assign_new/3` for optional attributes with computed defaults:

```elixir
def my_component(assigns) do
  assigns = assign_new(assigns, :bg_color, fn ->
    Enum.random(~w(bg-red-200 bg-green-200 bg-blue-200))
  end)
  
  ~H"""
  <div class={@bg_color}>...</div>
  """
end
```

## HEEx Special Attributes

### :if and :for Shorthand

Use `:if` and `:for` instead of `<%= if/for %>` blocks for cleaner templates:

```elixir
# Instead of:
<%= if @show do %>
  <div>Content</div>
<% end %>

# Use:
<div :if={@show}>Content</div>

# For loops:
<li :for={item <- @items}>{item.name}</li>

# Combined:
<.badge :for={tag <- @tags} :if={tag.visible} variant="info">
  {tag.name}
</.badge>
```

### :let for Receiving Slot Values

```elixir
<.form :let={f} for={@changeset}>
  <.input field={f[:email]} />
</.form>
```

---

## JS Command Composition in LiveView

### Problem: Piping into Assigns

You **cannot** pipe JS commands directly into an assign - HEEx tries to call the assign as a function:

```elixir
# WRONG - causes ArgumentError: you attempted to apply a function named :on_cancel on a map/struct
phx-click={hide_modal(@id) |> @on_cancel}
```

### Solution: Use JS.exec with Data Attributes

Store the JS commands in a data attribute and execute them with `JS.exec/3`:

```elixir
# CORRECT - store and execute pattern
data-cancel={JS.exec(@on_cancel, "phx-remove")}
phx-click={hide_modal(@id) |> JS.exec("data-cancel", to: "##{@id}")}
```

This is the same pattern Phoenix uses in its default modal component.

---

## HEEx Class List Conditionals

### Problem: Guard Clauses Don't Work

Elixir's `when` guard clause syntax doesn't work inside HEEx class lists:

```elixir
# WRONG - syntax error
class={[
  "rounded-full" when @shape == "circle",
  "mask mask-squircle" when @shape == "squircle"
]}
```

### Solution: Use Boolean && Expressions

```elixir
# CORRECT
class={[
  @shape == "circle" && "rounded-full",
  @shape == "squircle" && "mask mask-squircle"
]}
```

For more complex conditionals, use `if/2`:

```elixir
class={[
  if(@condition, do: "class-a", else: "class-b")
]}
```

---

## Verified Routes Sigil (~p) Limitations

### Problem: Query Parameters in Dev Routes

The `~p` sigil validates routes at compile time. Routes defined inside `if Application.compile_env(:app, :dev_routes)` blocks with query parameters cause warnings:

```elixir
# Causes warning: no route path for Router matches "/dev/components?tab=all"
<:tab patch={~p"/dev/components?tab=all"}>All</:tab>
```

### Solution: Use Plain Strings for Dev Routes with Query Params

```elixir
# Works without warnings
<:tab patch="/dev/components?tab=all">All</:tab>
```

---

## Router Scope Aliasing Gotcha

### Problem: Scope Alias Affects All Modules

Adding an alias to a `scope` affects all module references inside it:

```elixir
# WRONG - Plug.Swoosh becomes ElixirLizardsWeb.Plug.Swoosh
scope "/dev", ElixirLizardsWeb do
  forward "/mailbox", Plug.Swoosh.MailboxPreview  # Broken!
end
```

### Solution: Keep Scope Without Alias or Use Full Module Names

```elixir
# Option 1: No alias on scope
scope "/dev" do
  forward "/mailbox", Plug.Swoosh.MailboxPreview
  live "/components", ElixirLizardsWeb.ComponentDemoLive
end

# Option 2: Explicit Elixir prefix
scope "/dev", ElixirLizardsWeb do
  forward "/mailbox", Elixir.Plug.Swoosh.MailboxPreview
end
```

---

## Component Patterns

### Slot-Based Components

DaisyUI components map well to Phoenix slots:

```elixir
# Card component with slots
<.card>
  <:figure><img src="..." /></:figure>
  <:title>Title</:title>
  <:body>Content</:body>
  <:actions><.button>Action</.button></:actions>
</.card>
```

### Variant Handling

Use maps for variant-to-class mappings:

```elixir
def button(assigns) do
  variants = %{
    "primary" => "btn-primary",
    "secondary" => "btn-secondary",
    nil => "btn-primary btn-soft"
  }
  
  assigns = assign(assigns, :variant_class, Map.get(variants, assigns[:variant]))
  # ...
end
```

### Optional Slots

Check if slots are provided before rendering:

```elixir
<h3 :if={@title != []} class="card-title">
  {render_slot(@title)}
</h3>
```

---

## Development Workflow

1. **Run `mix precommit` frequently** - catches warnings-as-errors before they accumulate
2. **Create demo pages** - `/dev/components` for visual verification
3. **Test all variants** - each prop combination should be demonstrated
4. **Check compilation after each component** - `mix compile --warnings-as-errors`

---

## DaisyUI Component Reference

Components implemented in `core_components.ex`:

| Component | DaisyUI Classes | Key Features |
|-----------|-----------------|--------------|
| `modal` | `modal`, `modal-box`, `modal-backdrop` | JS show/hide, on_cancel callback |
| `card` | `card`, `card-body`, `card-title`, `card-actions` | figure, title, body, actions slots |
| `badge` | `badge`, `badge-{variant}`, `badge-{size}` | outline mode, all color variants |
| `dropdown` | `dropdown`, `dropdown-content`, `menu` | positioning, hover mode |
| `avatar` | `avatar`, masks, status indicators | placeholder fallback, shapes |
| `stat` | `stats`, `stat`, `stat-title`, `stat-value` | icons, descriptions, variants |
| `empty_state` | Custom Tailwind composition | icon, description, action slots |
| `tabs` | `tabs`, `tab`, `tabs-{variant}` | boxed, bordered, lifted variants |
| `breadcrumb` | `breadcrumbs` | navigation support |
| `tooltip` | `tooltip`, `tooltip-{position}` | positioning, color variants |
