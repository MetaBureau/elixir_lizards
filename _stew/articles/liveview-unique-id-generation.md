# The LiveView Unique ID Problem: Why Your Components Break on Re-render

Phoenix LiveView's efficient DOM patching relies on stable element IDs. When IDs change between renders, LiveView treats elements as entirely new nodes, causing hooks to remount, state to reset, and the DOM to thrash unnecessarily. This article examines a common pitfall with component ID generation and the correct solutions.

## The Problem

Consider a component that generates child element IDs:

```elixir
def combobox(assigns) do
  ~H"""
  <div id={"#{@id}-combo"}>
    <select id={@id}>
      <option :for={{opt, idx} <- Enum.with_index(@options)} id={"#{@id}-option-#{idx}"}>
        {opt.label}
      </option>
    </select>
  </div>
  """
end
```

This pattern works perfectly when `@id` has a stable value. The problem emerges when components try to be "helpful" by auto-generating IDs:

```elixir
# WRONG: Generates new ID on every render
def combobox(assigns) do
  assigns = assign(assigns, :id, assigns[:id] || "combo-#{System.unique_integer([:positive])}")
  # ...
end
```

Each time `render/1` executes, `System.unique_integer` produces a new value. The component's ID changes from `combo-12847` to `combo-12848`, and LiveView interprets this as the old element being removed and a new one being added. Any JavaScript hooks attached to the element will remount. Form state may reset. The user experience suffers.

## Why This Happens

The root cause is misunderstanding when code executes in LiveView's lifecycle. Function components run their entire body on every render—there's no persistent state between renders like there is in LiveComponents.

The `assign_new/3` function doesn't help either. It only assigns if the key is absent from assigns. With `attr :id, :any, default: nil`, the key exists (with value `nil`), so `assign_new` never triggers:

```elixir
# This doesn't work as expected
|> assign_new(:id, fn -> "combo-#{System.unique_integer([:positive])}" end)
```

## The Solutions

### 1. Require Explicit IDs

The most robust approach: make `id` a required attribute.

```elixir
attr :id, :string, required: true, doc: "Unique identifier for this component instance"
```

Callers must provide unique IDs, making the contract explicit. This is ideal for components that generate child element IDs or attach JavaScript hooks.

### 2. Derive from Stable Attributes

When you want optional IDs with sensible defaults, derive them from other stable attributes:

```elixir
def combobox(assigns) do
  assigns = assign(assigns, :id, assigns[:id] || assigns[:name])
  # ...
end
```

Form components typically have a `name` attribute that's stable and unique per form. Using it as the ID fallback maintains stability across re-renders.

For components without a natural stable attribute, consider using the `field` struct when working with Phoenix forms:

```elixir
def my_input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
  assigns = assign(assigns, :id, assigns[:id] || field.id)
  # ...
end
```

### 3. Generate Once in LiveComponents

For LiveComponents, generate the ID in `mount/2` or `update/2`, not in `render/1`:

```elixir
def mount(socket) do
  {:ok, assign(socket, :generated_id, "component-#{System.unique_integer([:positive])}")}
end
```

The ID is created once when the component mounts and remains stable for its lifetime.

### 4. Use @myself in LiveComponents

LiveComponents have access to `@myself`, a unique reference to the component instance:

```elixir
<div id={"dropdown-#{@myself}"}>
```

This is stable across re-renders and guaranteed unique per component instance.

## When Multiple Instances Share Names

A subtle case occurs with radio button groups. Radio buttons sharing the same `name` is correct for form semantics—it's how browsers know they're mutually exclusive. But if your component derives `id` from `name`, you'll have duplicate IDs.

The solution: provide explicit unique IDs for each radio button while keeping the shared name:

```elixir
<RadioField.radio_field id="size-small" name="size" value="small" label="Small" />
<RadioField.radio_field id="size-medium" name="size" value="medium" label="Medium" />
<RadioField.radio_field id="size-large" name="size" value="large" label="Large" />
```

## Key Takeaways

1. Never generate IDs inside `render/1` using non-deterministic functions
2. Prefer explicit required IDs for components with child elements or hooks
3. Derive IDs from stable attributes like `name` or `field.id` when possible
4. For LiveComponents, generate IDs in `mount/2` and store in assigns
5. Test your components with multiple instances on the same page

The DOM ID strategy you choose affects not just uniqueness but component lifecycle behaviour. Understanding when your code executes—and what values remain stable across re-renders—is essential for building reliable LiveView components.
