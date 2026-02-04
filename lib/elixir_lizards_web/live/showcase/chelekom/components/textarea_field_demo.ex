defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TextareaFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.TextareaField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Textarea Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Multi-line text inputs with variants and sizing options
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Outline Variant</h3>
          <TextareaField.textarea_field
            name="bio"
            value=""
            label="Biography"
            placeholder="Tell us about yourself..."
            floating="outer"
            variant="outline"
            color="primary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Description</h3>
          <TextareaField.textarea_field
            name="message"
            value=""
            label="Message"
            placeholder="Enter your message..."
            description="Maximum 500 characters"
            floating="outer"
            variant="outline"
            color="natural"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Shadow Variant</h3>
          <TextareaField.textarea_field
            name="notes"
            value=""
            label="Notes"
            placeholder="Add any additional notes..."
            floating="outer"
            variant="shadow"
            color="secondary"
          />
        </div>
      </div>
    </div>
    """
  end
end
