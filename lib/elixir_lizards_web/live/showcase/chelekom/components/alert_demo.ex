defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.AlertDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Alert

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Alert</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Contextual feedback messages with multiple variants and styles
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <Alert.alert kind={:info} title="Info">
          This is an informational message.
        </Alert.alert>

        <Alert.alert kind={:success} title="Success" variant="outline">
          Action completed successfully.
        </Alert.alert>

        <Alert.alert kind={:warning} title="Warning" variant="bordered">
          Please review your input.
        </Alert.alert>

        <Alert.alert kind={:error} title="Error" variant="shadow">
          Something went wrong.
        </Alert.alert>
      </div>

      <div class="flex justify-center">
        <Alert.flash_group flash={
          %{
            "info" => "Welcome to Mishka Chelekom components!",
            "success" => "Components loaded successfully",
            "error" => "Error message example"
          }
        } />
      </div>
    </div>
    """
  end
end
