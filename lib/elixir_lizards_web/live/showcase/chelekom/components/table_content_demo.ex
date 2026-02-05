defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TableContentDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.TableContent

  def render(assigns) do
    ~H"""
    <div id="table-content-demo" class="demo-component space-y-6">
      <div class="demo-header text-center">
        <h2 class="text-3xl font-bold mb-2">Table of Contents</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Navigation component for document sections
        </p>
      </div>

      <div class="demo-content max-w-4xl mx-auto space-y-8">
        <div id="table-content-basic" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Basic Table of Contents</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <TableContent.table_content space="small">
              <:item icon="hero-hashtag" link="#intro" link_title="Introduction"></:item>
              <:item icon="hero-hashtag" link="#getting-started" link_title="Getting Started"></:item>
              <:item icon="hero-hashtag" link="#installation" link_title="Installation"></:item>
              <:item icon="hero-hashtag" link="#usage" link_title="Usage"></:item>
              <:item icon="hero-hashtag" link="#api" link_title="API Reference"></:item>
            </TableContent.table_content>
          </div>
        </div>

        <div id="table-content-with-title" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Title</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <TableContent.table_content title="On this page" space="small">
              <:item icon="hero-hashtag" link="#overview" link_title="Overview"></:item>
              <:item icon="hero-hashtag" link="#features" link_title="Features"></:item>
              <:item icon="hero-hashtag" link="#examples" link_title="Examples"></:item>
              <:item icon="hero-hashtag" link="#faq" link_title="FAQ" active></:item>
            </TableContent.table_content>
          </div>
        </div>

        <div id="table-content-nested" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Nested Content</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <TableContent.table_content title="Documentation" space="small">
              <:item icon="hero-hashtag" link="#basics" link_title="Basics"></:item>
              <:item title="Components">
                <TableContent.content_wrapper class="space-y-2 mt-2">
                  <TableContent.content_item icon="hero-minus" class="pl-4">
                    <a href="#buttons">Buttons</a>
                  </TableContent.content_item>
                  <TableContent.content_item icon="hero-minus" class="pl-4">
                    <a href="#forms">Forms</a>
                  </TableContent.content_item>
                  <TableContent.content_item icon="hero-minus" class="pl-4">
                    <a href="#navigation">Navigation</a>
                  </TableContent.content_item>
                </TableContent.content_wrapper>
              </:item>
              <:item icon="hero-hashtag" link="#advanced" link_title="Advanced"></:item>
            </TableContent.table_content>
          </div>
        </div>

        <div id="table-content-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <div class="demo-grid grid md:grid-cols-2 gap-6">
            <div
              id="table-content-color-primary"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <TableContent.table_content color="primary" title="Primary" space="small">
                <:item link="#section1" link_title="Section 1"></:item>
                <:item link="#section2" link_title="Section 2"></:item>
                <:item link="#section3" link_title="Section 3"></:item>
              </TableContent.table_content>
            </div>

            <div
              id="table-content-color-secondary"
              class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg"
            >
              <TableContent.table_content color="secondary" title="Secondary" space="small">
                <:item link="#section1" link_title="Section 1"></:item>
                <:item link="#section2" link_title="Section 2"></:item>
                <:item link="#section3" link_title="Section 3"></:item>
              </TableContent.table_content>
            </div>
          </div>
        </div>

        <div id="table-content-animated" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Animation (Smooth Scroll)</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <TableContent.table_content title="Animated Navigation" animated space="small">
              <:item icon="hero-hashtag" link="#section-a" link_title="Section A"></:item>
              <:item icon="hero-hashtag" link="#section-b" link_title="Section B"></:item>
              <:item icon="hero-hashtag" link="#section-c" link_title="Section C"></:item>
            </TableContent.table_content>
          </div>
        </div>

        <div id="table-content-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;TableContent.table_content title="On this page" animated space="small"&gt;
    &lt;:item icon="hero-hashtag" link="#intro" link_title="Introduction"&gt;&lt;/:item&gt;
    &lt;:item icon="hero-hashtag" link="#usage" link_title="Usage" active&gt;&lt;/:item&gt;
    &lt;:item title="Nested Section"&gt;
    &lt;TableContent.content_wrapper&gt;
      &lt;TableContent.content_item&gt;
        &lt;a href="#sub-item"&gt;Sub Item&lt;/a&gt;
      &lt;/TableContent.content_item&gt;
    &lt;/TableContent.content_wrapper&gt;
    &lt;/:item&gt;
    &lt;/TableContent.table_content&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
