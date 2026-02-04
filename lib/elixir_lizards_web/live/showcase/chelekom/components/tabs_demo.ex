defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TabsDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Tabs

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Tabs</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Organize content into switchable panels
        </p>
      </div>

      <div class="max-w-2xl mx-auto">
        <Tabs.tabs id="chelekom-tabs" color="primary" variant="pills" padding="small">
          <:tab icon="hero-home" active>Home</:tab>
          <:tab icon="hero-user">Profile</:tab>
          <:tab icon="hero-cog-6-tooth">Settings</:tab>

          <:panel>
            <div class="p-4">
              <h3 class="font-semibold mb-2">Welcome Home</h3>
              <p>This is the home tab content.</p>
            </div>
          </:panel>
          <:panel>
            <div class="p-4">
              <h3 class="font-semibold mb-2">User Profile</h3>
              <p>View and edit your profile information here.</p>
            </div>
          </:panel>
          <:panel>
            <div class="p-4">
              <h3 class="font-semibold mb-2">Settings</h3>
              <p>Customize your application preferences.</p>
            </div>
          </:panel>
        </Tabs.tabs>
      </div>
    </div>
    """
  end
end
