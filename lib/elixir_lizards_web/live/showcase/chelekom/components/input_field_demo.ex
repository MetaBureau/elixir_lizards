defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.InputFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.InputField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Input Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Generic input wrapper with consistent styling
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <InputField.input
          name="generic_input"
          value=""
          label="Generic Input"
          placeholder="Enter value..."
        />
        <InputField.input
          name="with_label"
          value=""
          label="With Label"
          placeholder="Type here..."
        />
      </div>
    </div>
    """
  end
end
