defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.FileFieldDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.FileField

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">File Field</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          File upload inputs with various styles
        </p>
      </div>

      <div class="max-w-md mx-auto space-y-4">
        <FileField.file_field
          name="document"
          label="Upload Document"
          color="primary"
        />
        <FileField.file_field
          name="images"
          label="Upload Images"
          color="info"
        />
      </div>
    </div>
    """
  end
end
