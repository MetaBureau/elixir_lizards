defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.FileFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.FileField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">File Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          File upload inputs with color variants
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-6">
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Primary Color</h3>
          <FileField.file_field
            name="document"
            label="Upload Document"
            color="primary"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Success Color</h3>
          <FileField.file_field
            name="avatar"
            label="Profile Picture"
            color="success"
          />
        </div>

        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Info Color</h3>
          <FileField.file_field
            name="images"
            label="Upload Images"
            color="info"
          />
        </div>
      </div>
    </div>
    """
  end
end
