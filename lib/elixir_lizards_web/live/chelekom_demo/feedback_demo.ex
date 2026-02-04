defmodule ElixirLizardsWeb.ChelekomDemo.FeedbackDemo do
  @moduledoc """
  Feedback components demo: Alert, Progress, Spinner, Skeleton, Flash
  """
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Alert, Progress, Skeleton, Spinner}

  def render(assigns) do
    ~H"""
    <div class="space-y-12">
      <!-- Alert -->
      <section class="space-y-6">
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
      </section>

      <!-- Progress -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Progress</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Visual indicators for task completion and loading states
          </p>
        </div>

        <div class="space-y-4 max-w-xl mx-auto">
          <Progress.progress value={25} color="primary" size="small" />
          <Progress.progress value={50} color="secondary" size="medium" />
          <Progress.progress value={75} color="success" size="large" />
          <Progress.progress value={90} color="warning" size="extra_large" />
        </div>
      </section>

      <!-- Spinner -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Spinner</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Loading indicators with multiple animation styles
          </p>
        </div>

        <div class="space-y-6">
          <div>
            <h3 class="text-lg font-semibold mb-3 text-center">Sizes</h3>
            <div class="flex flex-wrap gap-6 justify-center items-center">
              <Spinner.spinner size="extra_small" color="primary" />
              <Spinner.spinner size="small" color="secondary" />
              <Spinner.spinner size="medium" color="success" />
              <Spinner.spinner size="large" color="warning" />
            </div>
          </div>
          <div>
            <h3 class="text-lg font-semibold mb-3 text-center">Animation Types</h3>
            <div class="flex flex-wrap gap-8 justify-center items-center">
              <div class="text-center">
                <Spinner.spinner type="default" size="large" color="primary" />
                <p class="text-sm mt-2">Default</p>
              </div>
              <div class="text-center">
                <Spinner.spinner type="dots" size="large" color="secondary" />
                <p class="text-sm mt-2">Dots</p>
              </div>
              <div class="text-center">
                <Spinner.spinner type="bars" size="large" color="success" />
                <p class="text-sm mt-2">Bars</p>
              </div>
              <div class="text-center">
                <Spinner.spinner type="pinging" size="large" color="warning" />
                <p class="text-sm mt-2">Pinging</p>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Skeleton -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Skeleton</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Loading placeholders for content that is being fetched
          </p>
        </div>

        <div class="max-w-md mx-auto space-y-4">
          <div class="flex items-center gap-4">
            <Skeleton.skeleton width="w-12" height="h-12" rounded="full" animated />
            <div class="flex-1 space-y-2">
              <Skeleton.skeleton width="w-3/4" height="small" animated />
              <Skeleton.skeleton width="w-1/2" height="extra_small" animated />
            </div>
          </div>
          <Skeleton.skeleton width="full" height="medium" animated />
          <Skeleton.skeleton width="full" height="extra_large" animated />
        </div>
      </section>

      <!-- Flash Group -->
      <section class="space-y-6">
        <div class="text-center">
          <h2 class="text-3xl font-bold mb-2">Flash Group</h2>
          <p class="text-base-content/70 max-w-2xl mx-auto">
            Toast notifications for system messages and user feedback
          </p>
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
      </section>
    </div>
    """
  end
end
