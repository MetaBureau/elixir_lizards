defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ToastDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Toast

  def render(assigns) do
    ~H"""
    <div id="toast-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Toast</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Temporary notification messages for user feedback
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="toast-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <p class="text-sm text-base-content/60 mb-4">
            Static examples (toasts are normally fixed positioned)
          </p>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-grid grid gap-4">
              <div id="toast-color-natural" class="demo-item">
                <Toast.toast id="toast-demo-1" color="natural" fixed={false}>
                  <div>Natural toast message</div>
                </Toast.toast>
              </div>

              <div id="toast-color-primary" class="demo-item">
                <Toast.toast id="toast-demo-2" color="primary" fixed={false}>
                  <div>Primary toast notification</div>
                </Toast.toast>
              </div>

              <div id="toast-color-success" class="demo-item">
                <Toast.toast id="toast-demo-3" color="success" fixed={false}>
                  <div>Success! Operation completed.</div>
                </Toast.toast>
              </div>

              <div id="toast-color-warning" class="demo-item">
                <Toast.toast id="toast-demo-4" color="warning" fixed={false}>
                  <div>Warning: Please review your input.</div>
                </Toast.toast>
              </div>

              <div id="toast-color-danger" class="demo-item">
                <Toast.toast id="toast-demo-5" color="danger" fixed={false}>
                  <div>Error: Something went wrong.</div>
                </Toast.toast>
              </div>
            </div>
          </div>
        </div>

        <div id="toast-variants" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Variant Styles</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-grid grid gap-4">
              <div id="toast-variant-default" class="demo-item">
                <Toast.toast id="toast-demo-6" variant="default" color="info" fixed={false}>
                  <div>Default variant toast</div>
                </Toast.toast>
              </div>

              <div id="toast-variant-outline" class="demo-item">
                <Toast.toast id="toast-demo-7" variant="outline" color="secondary" fixed={false}>
                  <div>Outline variant toast</div>
                </Toast.toast>
              </div>

              <div id="toast-variant-bordered" class="demo-item">
                <Toast.toast id="toast-demo-8" variant="bordered" color="misc" fixed={false}>
                  <div>Bordered variant toast</div>
                </Toast.toast>
              </div>

              <div id="toast-variant-shadow" class="demo-item">
                <Toast.toast id="toast-demo-9" variant="shadow" color="dawn" fixed={false}>
                  <div>Shadow variant toast</div>
                </Toast.toast>
              </div>
            </div>
          </div>
        </div>

        <div id="toast-borders" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Content Border</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <div class="demo-grid grid gap-4">
              <div id="toast-border-start" class="demo-item">
                <Toast.toast
                  id="toast-demo-10"
                  color="success"
                  content_border="small"
                  border_position="start"
                  fixed={false}
                >
                  <div>Toast with start border indicator</div>
                </Toast.toast>
              </div>

              <div id="toast-border-end" class="demo-item">
                <Toast.toast
                  id="toast-demo-11"
                  color="danger"
                  content_border="small"
                  border_position="end"
                  fixed={false}
                >
                  <div>Toast with end border indicator</div>
                </Toast.toast>
              </div>
            </div>
          </div>
        </div>

        <div id="toast-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;Toast.toast id="my-toast" color="success" vertical="bottom" horizontal="right"&gt;
    &lt;div&gt;Your changes have been saved!&lt;/div&gt;
    &lt;/Toast.toast&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
