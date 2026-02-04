defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.ToastDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Toast

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Toast</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Temporary notification messages for user feedback
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Color Variants</h3>
          <p class="text-sm text-base-content/60 mb-4">
            Static examples (toasts are normally fixed positioned)
          </p>
          <div class="grid gap-4">
            <Toast.toast id="toast-demo-1" color="natural" fixed={false}>
              <div>Natural toast message</div>
            </Toast.toast>

            <Toast.toast id="toast-demo-2" color="primary" fixed={false}>
              <div>Primary toast notification</div>
            </Toast.toast>

            <Toast.toast id="toast-demo-3" color="success" fixed={false}>
              <div>Success! Operation completed.</div>
            </Toast.toast>

            <Toast.toast id="toast-demo-4" color="warning" fixed={false}>
              <div>Warning: Please review your input.</div>
            </Toast.toast>

            <Toast.toast id="toast-demo-5" color="danger" fixed={false}>
              <div>Error: Something went wrong.</div>
            </Toast.toast>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Variant Styles</h3>
          <div class="grid gap-4">
            <Toast.toast id="toast-demo-6" variant="default" color="info" fixed={false}>
              <div>Default variant toast</div>
            </Toast.toast>

            <Toast.toast id="toast-demo-7" variant="outline" color="secondary" fixed={false}>
              <div>Outline variant toast</div>
            </Toast.toast>

            <Toast.toast id="toast-demo-8" variant="bordered" color="misc" fixed={false}>
              <div>Bordered variant toast</div>
            </Toast.toast>

            <Toast.toast id="toast-demo-9" variant="shadow" color="dawn" fixed={false}>
              <div>Shadow variant toast</div>
            </Toast.toast>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">With Content Border</h3>
          <div class="grid gap-4">
            <Toast.toast
              id="toast-demo-10"
              color="success"
              content_border="small"
              border_position="start"
              fixed={false}
            >
              <div>Toast with start border indicator</div>
            </Toast.toast>

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

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;Toast.toast id="my-toast" color="success" vertical="bottom" horizontal="right"&gt;
    &lt;div&gt;Your changes have been saved!&lt;/div&gt;
    &lt;/Toast.toast&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
