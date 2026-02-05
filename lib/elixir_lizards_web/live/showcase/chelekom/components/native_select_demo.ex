defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.NativeSelectDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.NativeSelect

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Native Select</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Native dropdown select inputs with variants, colors, and multiple selection
        </p>
      </div>

      <div class="max-w-2xl mx-auto space-y-8">
        <!-- Default variant -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Default Variant</h3>
          <NativeSelect.native_select
            id="native-select-country"
            name="country"
            label="Select Country"
            description="Choose your country of residence"
            variant="default"
            color="natural"
          >
            <:option value="">Select an option</:option>
            <:option value="us">United States</:option>
            <:option value="uk">United Kingdom</:option>
            <:option value="ca">Canada</:option>
            <:option value="au">Australia</:option>
          </NativeSelect.native_select>
        </div>
        
    <!-- Shadow variant with color -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Shadow Variant</h3>
          <NativeSelect.native_select
            name="priority"
            label="Priority Level"
            variant="shadow"
            color="primary"
          >
            <:option value="low">Low Priority</:option>
            <:option value="medium" selected>Medium Priority</:option>
            <:option value="high">High Priority</:option>
          </NativeSelect.native_select>
        </div>
        
    <!-- Bordered variant -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Bordered Variant</h3>
          <NativeSelect.native_select
            name="category"
            label="Category"
            variant="bordered"
            color="secondary"
          >
            <:option value="tech">Technology</:option>
            <:option value="design">Design</:option>
            <:option value="marketing">Marketing</:option>
          </NativeSelect.native_select>
        </div>
        
    <!-- Multiple selection -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">Multiple Selection</h3>
          <NativeSelect.native_select
            name="languages"
            label="Programming Languages"
            description="Select all that apply"
            variant="default"
            color="info"
            multiple
          >
            <:option value="elixir">Elixir</:option>
            <:option value="rust">Rust</:option>
            <:option value="go">Go</:option>
            <:option value="python">Python</:option>
          </NativeSelect.native_select>
        </div>
        
    <!-- With disabled option -->
        <div class="space-y-2">
          <h3 class="text-sm font-semibold text-base-content/60">With Disabled Options</h3>
          <NativeSelect.native_select
            id="native-select-plan"
            name="plan"
            label="Subscription Plan"
            variant="default"
            color="success"
          >
            <:option value="free">Free Tier</:option>
            <:option value="pro">Pro Plan</:option>
            <:option value="enterprise" disabled="disabled">Enterprise (Contact Sales)</:option>
          </NativeSelect.native_select>
        </div>
      </div>
    </div>
    """
  end
end
