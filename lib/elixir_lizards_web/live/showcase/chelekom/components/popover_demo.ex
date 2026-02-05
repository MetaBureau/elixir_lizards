defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.PopoverDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Popover

  def render(assigns) do
    ~H"""
    <div id="popover-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Popover</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Interactive popover dialogs for displaying contextual information
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="popover-positions" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Basic Popover (Hover)</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-8 justify-center py-8">
              <div id="popover-position-top" class="demo-item">
                <Popover.popover id="popover-demo-1" position="top">
                  <:trigger>
                    <button class="btn btn-outline btn-primary">Hover me (Top)</button>
                  </:trigger>
                  <:content>
                    <span>This popover appears on top!</span>
                  </:content>
                </Popover.popover>
              </div>

              <div id="popover-position-bottom" class="demo-item">
                <Popover.popover id="popover-demo-2" position="bottom">
                  <:trigger>
                    <button class="btn btn-outline btn-secondary">Hover me (Bottom)</button>
                  </:trigger>
                  <:content>
                    <span>This popover appears on bottom!</span>
                  </:content>
                </Popover.popover>
              </div>

              <div id="popover-position-left" class="demo-item">
                <Popover.popover id="popover-demo-3" position="left">
                  <:trigger>
                    <button class="btn btn-outline btn-accent">Hover me (Left)</button>
                  </:trigger>
                  <:content>
                    <span>This popover appears on left!</span>
                  </:content>
                </Popover.popover>
              </div>

              <div id="popover-position-right" class="demo-item">
                <Popover.popover id="popover-demo-4" position="right">
                  <:trigger>
                    <button class="btn btn-outline btn-info">Hover me (Right)</button>
                  </:trigger>
                  <:content>
                    <span>This popover appears on right!</span>
                  </:content>
                </Popover.popover>
              </div>
            </div>
          </div>
        </div>

        <div id="popover-clickable" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Clickable Popovers</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-8 justify-center py-8">
              <div id="popover-clickable-default" class="demo-item">
                <Popover.popover id="popover-click-1" clickable position="bottom">
                  <:trigger>
                    <button class="btn btn-primary">Click me</button>
                  </:trigger>
                  <:content>
                    <div class="space-y-2">
                      <span class="font-semibold block">Clickable Popover</span>
                      <span class="block text-sm">
                        This popover stays open until you click elsewhere.
                      </span>
                    </div>
                  </:content>
                </Popover.popover>
              </div>

              <div id="popover-clickable-success" class="demo-item">
                <Popover.popover
                  id="popover-click-2"
                  clickable
                  position="bottom"
                  color="success"
                  variant="default"
                >
                  <:trigger>
                    <button class="btn btn-success">Success Popover</button>
                  </:trigger>
                  <:content>
                    <div class="space-y-2">
                      <span class="font-semibold block">Success!</span>
                      <span class="block text-sm">Your action was completed successfully.</span>
                    </div>
                  </:content>
                </Popover.popover>
              </div>
            </div>
          </div>
        </div>

        <div id="popover-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-items flex flex-wrap gap-4 justify-center py-8">
              <div id="popover-color-primary" class="demo-item">
                <Popover.popover
                  id="popover-color-1"
                  variant="default"
                  color="primary"
                  position="bottom"
                >
                  <:trigger>
                    <span class="badge badge-primary cursor-pointer">Primary</span>
                  </:trigger>
                  <:content>
                    <span>Primary colored popover</span>
                  </:content>
                </Popover.popover>
              </div>

              <div id="popover-color-secondary" class="demo-item">
                <Popover.popover
                  id="popover-color-2"
                  variant="default"
                  color="secondary"
                  position="bottom"
                >
                  <:trigger>
                    <span class="badge badge-secondary cursor-pointer">Secondary</span>
                  </:trigger>
                  <:content>
                    <span>Secondary colored popover</span>
                  </:content>
                </Popover.popover>
              </div>

              <div id="popover-color-warning" class="demo-item">
                <Popover.popover
                  id="popover-color-3"
                  variant="default"
                  color="warning"
                  position="bottom"
                >
                  <:trigger>
                    <span class="badge badge-warning cursor-pointer">Warning</span>
                  </:trigger>
                  <:content>
                    <span>Warning colored popover</span>
                  </:content>
                </Popover.popover>
              </div>

              <div id="popover-color-danger" class="demo-item">
                <Popover.popover
                  id="popover-color-4"
                  variant="default"
                  color="danger"
                  position="bottom"
                >
                  <:trigger>
                    <span class="badge badge-error cursor-pointer">Danger</span>
                  </:trigger>
                  <:content>
                    <span>Danger colored popover</span>
                  </:content>
                </Popover.popover>
              </div>

              <div id="popover-color-info" class="demo-item">
                <Popover.popover id="popover-color-5" variant="default" color="info" position="bottom">
                  <:trigger>
                    <span class="badge badge-info cursor-pointer">Info</span>
                  </:trigger>
                  <:content>
                    <span>Info colored popover</span>
                  </:content>
                </Popover.popover>
              </div>
            </div>
          </div>
        </div>

        <div id="popover-inline" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Inline Popover</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <p class="py-4">
              Popovers can be used inline within text. For example, you can highlight
              <Popover.popover id="popover-inline-1" inline position="top">
                <:trigger>
                  <span class="text-primary underline cursor-pointer">important terms</span>
                </:trigger>
                <:content>
                  <span>This is an inline popover that provides additional context!</span>
                </:content>
              </Popover.popover>
              to provide additional information without disrupting the reading flow.
            </p>
          </div>
        </div>

        <div id="popover-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;Popover.popover id="my-popover" clickable position="bottom"&gt;
    &lt;:trigger&gt;
    &lt;button class="btn"&gt;Open Popover&lt;/button&gt;
    &lt;/:trigger&gt;
    &lt;:content&gt;
    &lt;div&gt;Popover content here&lt;/div&gt;
    &lt;/:content&gt;
    &lt;/Popover.popover&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
