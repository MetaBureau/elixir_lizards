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
            <TableContent.table_content>
              <TableContent.content_item link_title="Home" link="#home" />
              <TableContent.content_item link_title="Overview" link="#overview" />
              <TableContent.content_item link_title="Slots" link="#slots" />
            </TableContent.table_content>
          </div>
        </div>

        <div id="table-content-with-title" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Title</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <TableContent.table_content title="On this page">
              <TableContent.content_item link_title="Introduction" link="#intro" />
              <TableContent.content_item link_title="Getting Started" link="#getting-started" />
              <TableContent.content_item link_title="Installation" link="#installation" />
              <TableContent.content_item link_title="API Reference" link="#api" active />
            </TableContent.table_content>
          </div>
        </div>

        <div id="table-content-with-icons" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Icons</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <TableContent.table_content>
              <TableContent.content_item icon="hero-home" link_title="Home" link="#home" />
              <TableContent.content_item
                icon="hero-document-text"
                link_title="Documentation"
                link="#docs"
              />
              <TableContent.content_item
                icon="hero-cog-6-tooth"
                link_title="Settings"
                link="#settings"
              />
            </TableContent.table_content>
          </div>
        </div>

        <div id="table-content-nested" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Nested Content</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <TableContent.table_content title="Documentation">
              <TableContent.content_item link_title="Basics" link="#basics" />
              <TableContent.content_item title="Components">
                <TableContent.content_wrapper class="space-y-1 mt-1 ml-4">
                  <TableContent.content_item icon="hero-minus">
                    <a href="#buttons" class="hover:underline">Buttons</a>
                  </TableContent.content_item>
                  <TableContent.content_item icon="hero-minus">
                    <a href="#forms" class="hover:underline">Forms</a>
                  </TableContent.content_item>
                  <TableContent.content_item icon="hero-minus">
                    <a href="#navigation" class="hover:underline">Navigation</a>
                  </TableContent.content_item>
                </TableContent.content_wrapper>
              </TableContent.content_item>
              <TableContent.content_item link_title="Advanced" link="#advanced" />
            </TableContent.table_content>
          </div>
        </div>

        <div id="table-content-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <div class="demo-grid grid md:grid-cols-2 gap-6">
            <div id="table-content-color-primary" class="demo-box">
              <TableContent.table_content
                variant="default"
                color="primary"
                title="Primary"
                padding="small"
                rounded="medium"
              >
                <TableContent.content_item link_title="Section 1" link="#section1" />
                <TableContent.content_item link_title="Section 2" link="#section2" />
                <TableContent.content_item link_title="Section 3" link="#section3" />
              </TableContent.table_content>
            </div>

            <div id="table-content-color-secondary" class="demo-box">
              <TableContent.table_content
                variant="default"
                color="secondary"
                title="Secondary"
                padding="small"
                rounded="medium"
              >
                <TableContent.content_item link_title="Section 1" link="#section1" />
                <TableContent.content_item link_title="Section 2" link="#section2" />
                <TableContent.content_item link_title="Section 3" link="#section3" />
              </TableContent.table_content>
            </div>
          </div>
        </div>

        <div id="table-content-variants" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Style Variants</h3>
          <div class="demo-grid grid md:grid-cols-2 gap-6">
            <div id="table-content-variant-outline" class="demo-box">
              <TableContent.table_content
                variant="outline"
                color="primary"
                title="Outline"
                padding="small"
                rounded="medium"
              >
                <TableContent.content_item link_title="Item 1" link="#item1" />
                <TableContent.content_item link_title="Item 2" link="#item2" />
              </TableContent.table_content>
            </div>

            <div id="table-content-variant-bordered" class="demo-box">
              <TableContent.table_content
                variant="bordered"
                color="info"
                title="Bordered"
                padding="small"
                rounded="medium"
              >
                <TableContent.content_item link_title="Item 1" link="#item1" />
                <TableContent.content_item link_title="Item 2" link="#item2" />
              </TableContent.table_content>
            </div>
          </div>
        </div>

        <div id="table-content-animated" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Animation (Smooth Scroll)</h3>
          <div class="demo-box p-4 bg-base-100 border border-base-300 rounded-lg">
            <TableContent.table_content title="Animated Navigation" animated>
              <TableContent.content_item icon="hero-hashtag" link_title="Section A" link="#section-a" />
              <TableContent.content_item icon="hero-hashtag" link_title="Section B" link="#section-b" />
              <TableContent.content_item
                icon="hero-hashtag"
                link_title="Section C"
                link="#section-c"
                active
              />
            </TableContent.table_content>
          </div>
        </div>

        <div id="table-content-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;TableContent.table_content title="On this page" animated&gt;
    &lt;TableContent.content_item link_title="Home" link="#home" /&gt;
    &lt;TableContent.content_item link_title="Overview" link="#overview" /&gt;
    &lt;TableContent.content_item title="Components"&gt;
    &lt;TableContent.content_wrapper&gt;
      &lt;TableContent.content_item icon="hero-minus"&gt;
        &lt;a href="#buttons"&gt;Buttons&lt;/a&gt;
      &lt;/TableContent.content_item&gt;
    &lt;/TableContent.content_wrapper&gt;
    &lt;/TableContent.content_item&gt;
    &lt;/TableContent.table_content&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
