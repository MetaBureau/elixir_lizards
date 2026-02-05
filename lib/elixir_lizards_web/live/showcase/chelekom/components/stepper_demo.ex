defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.StepperDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Stepper

  def render(assigns) do
    ~H"""
    <div id="stepper-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Stepper</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Multi-step process indicators for forms and workflows
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="stepper-horizontal" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Basic Horizontal Stepper</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <Stepper.stepper>
              <Stepper.stepper_section
                step="completed"
                title="Account"
                description="Create your account"
              />
              <Stepper.stepper_section
                step="current"
                title="Profile"
                description="Add profile details"
              />
              <Stepper.stepper_section title="Verification" description="Verify your email" />
              <Stepper.stepper_section title="Complete" description="Start using the app" />
            </Stepper.stepper>
          </div>
        </div>

        <div id="stepper-vertical" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Vertical Stepper</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <Stepper.stepper vertical>
              <Stepper.stepper_section
                step="completed"
                title="Order Placed"
                description="Your order has been confirmed"
              />
              <Stepper.stepper_section
                step="completed"
                title="Processing"
                description="Order is being prepared"
              />
              <Stepper.stepper_section
                step="current"
                title="Shipping"
                description="Package is on the way"
              />
              <Stepper.stepper_section title="Delivered" description="Package will arrive soon" />
            </Stepper.stepper>
          </div>
        </div>

        <div id="stepper-icons" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Icons</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <Stepper.stepper>
              <Stepper.stepper_section step="completed" icon="hero-user" title="Account" />
              <Stepper.stepper_section step="current" icon="hero-credit-card" title="Payment" />
              <Stepper.stepper_section icon="hero-truck" title="Shipping" />
              <Stepper.stepper_section icon="hero-check-circle" title="Complete" />
            </Stepper.stepper>
          </div>
        </div>

        <div id="stepper-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <div class="demo-variants space-y-6">
            <div
              id="stepper-color-primary"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <p class="demo-label text-sm text-base-content/60 mb-2">Primary</p>
              <Stepper.stepper color="primary">
                <Stepper.stepper_section step="completed" title="Step 1" />
                <Stepper.stepper_section step="current" title="Step 2" />
                <Stepper.stepper_section title="Step 3" />
              </Stepper.stepper>
            </div>

            <div
              id="stepper-color-success"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <p class="demo-label text-sm text-base-content/60 mb-2">Success</p>
              <Stepper.stepper color="success">
                <Stepper.stepper_section step="completed" title="Step 1" />
                <Stepper.stepper_section step="current" title="Step 2" />
                <Stepper.stepper_section title="Step 3" />
              </Stepper.stepper>
            </div>

            <div
              id="stepper-color-info"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <p class="demo-label text-sm text-base-content/60 mb-2">Info</p>
              <Stepper.stepper color="info">
                <Stepper.stepper_section step="completed" title="Step 1" />
                <Stepper.stepper_section step="current" title="Step 2" />
                <Stepper.stepper_section title="Step 3" />
              </Stepper.stepper>
            </div>
          </div>
        </div>

        <div id="stepper-sizes" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Different Sizes</h3>
          <div class="demo-variants space-y-6">
            <div
              id="stepper-size-small"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <p class="demo-label text-sm text-base-content/60 mb-2">Small</p>
              <Stepper.stepper size="small">
                <Stepper.stepper_section step="completed" title="Step 1" />
                <Stepper.stepper_section step="current" title="Step 2" />
                <Stepper.stepper_section title="Step 3" />
              </Stepper.stepper>
            </div>

            <div
              id="stepper-size-large"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <p class="demo-label text-sm text-base-content/60 mb-2">Large</p>
              <Stepper.stepper size="large">
                <Stepper.stepper_section step="completed" title="Step 1" />
                <Stepper.stepper_section step="current" title="Step 2" />
                <Stepper.stepper_section title="Step 3" />
              </Stepper.stepper>
            </div>
          </div>
        </div>

        <div id="stepper-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;Stepper.stepper color="primary"&gt;
    &lt;Stepper.stepper_section step="completed" title="Step 1" description="Done" /&gt;
    &lt;Stepper.stepper_section step="current" title="Step 2" description="In progress" /&gt;
    &lt;Stepper.stepper_section title="Step 3" description="Pending" /&gt;
    &lt;/Stepper.stepper&gt;

    &lt;!-- Vertical stepper --&gt;
    &lt;Stepper.stepper vertical&gt;
    &lt;Stepper.stepper_section step="completed" icon="hero-check" title="Complete" /&gt;
    &lt;Stepper.stepper_section step="current" title="Current Step" /&gt;
    &lt;/Stepper.stepper&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
