defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TextareaFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.TextareaField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Textarea Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Multi-line text inputs for longer content
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <TextareaField.textarea_field
          name="bio"
          value=""
          label="Bio"
          placeholder="Tell us about yourself..."
          floating="outer"
        />
        <TextareaField.textarea_field
          name="message"
          value=""
          label="Message"
          placeholder="Enter your message..."
          description="Maximum 500 characters"
          floating="outer"
        />
      </div>
    </div>
    """
  end
end
