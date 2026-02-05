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
        <%!-- Basic with content_item and link props --%>
        <div id="table-content-basic" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Basic Table of Contents</h3>
          <div class="demo-box">
            <TableContent.table_content padding="small" rounded="medium">
              <TableContent.content_item link_title="Home" link="#home" />
              <TableContent.content_item link_title="Overview" link="#overview" />
              <TableContent.content_item link_title="Slots" link="#slots" />
            </TableContent.table_content>
          </div>
        </div>

        <%!-- With Title --%>
        <div id="table-content-with-title" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Title</h3>
          <div class="demo-box">
            <TableContent.table_content title="On this page" padding="small" rounded="medium">
              <TableContent.content_item link_title="Introduction" link="#intro" />
              <TableContent.content_item link_title="Getting Started" link="#getting-started" />
              <TableContent.content_item link_title="Installation" link="#installation" />
            </TableContent.table_content>
          </div>
        </div>

        <%!-- With Icons --%>
        <div id="table-content-with-icons" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">With Icons</h3>
          <div class="demo-box">
            <TableContent.table_content padding="small" rounded="medium">
              <TableContent.content_item icon="hero-home">
                <.link patch="#home">Home</.link>
              </TableContent.content_item>
              <TableContent.content_item icon="hero-document-text">
                <.link patch="#docs">Documentation</.link>
              </TableContent.content_item>
              <TableContent.content_item icon="hero-cog-6-tooth">
                <.link patch="#settings">Settings</.link>
              </TableContent.content_item>
            </TableContent.table_content>
          </div>
        </div>

        <%!-- Active State --%>
        <div id="table-content-active" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Active State</h3>
          <div class="demo-box">
            <TableContent.table_content padding="small" rounded="medium">
              <TableContent.content_item>
                <.link patch="#section1">Section 1</.link>
              </TableContent.content_item>
              <TableContent.content_item active>
                <.link patch="#section2">Section 2 (Active)</.link>
              </TableContent.content_item>
              <TableContent.content_item>
                <.link patch="#section3">Section 3</.link>
              </TableContent.content_item>
            </TableContent.table_content>
          </div>
        </div>

        <%!-- Nested Content Structure --%>
        <div id="table-content-nested" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Nested Content</h3>
          <div class="demo-box">
            <TableContent.table_content padding="small" rounded="medium">
              <TableContent.content_item title="Table content props">
                <TableContent.content_wrapper>
                  <TableContent.content_item icon="hero-chevron-right">
                    <.link patch="#overview">Overview</.link>
                  </TableContent.content_item>
                  <TableContent.content_item icon="hero-chevron-right">
                    <.link patch="#color-variants">Color and Variants</.link>
                  </TableContent.content_item>
                  <TableContent.content_item icon="hero-chevron-right">
                    <.link patch="#space">Space</.link>
                  </TableContent.content_item>
                  <TableContent.content_item icon="hero-chevron-right">
                    <.link patch="#padding">Padding</.link>
                  </TableContent.content_item>
                </TableContent.content_wrapper>
              </TableContent.content_item>

              <TableContent.content_item title="Content item props">
                <TableContent.content_wrapper>
                  <TableContent.content_item icon="hero-chevron-right">
                    <.link patch="#icons">Icons</.link>
                  </TableContent.content_item>
                  <TableContent.content_item icon="hero-chevron-right">
                    <.link patch="#active">Active State</.link>
                  </TableContent.content_item>
                  <TableContent.content_item icon="hero-chevron-right">
                    <.link patch="#font-weight">Font Weight</.link>
                  </TableContent.content_item>
                </TableContent.content_wrapper>
              </TableContent.content_item>
            </TableContent.table_content>
          </div>
        </div>

        <%!-- Color Variants --%>
        <div id="table-content-colors" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Color Variants</h3>
          <div class="demo-grid grid md:grid-cols-2 gap-4">
            <div id="table-content-color-primary" class="demo-box">
              <TableContent.table_content
                color="primary"
                variant="default"
                padding="small"
                rounded="medium"
              >
                <TableContent.content_item link_title="Section 1" link="#s1" />
                <TableContent.content_item link_title="Section 2" link="#s2" />
              </TableContent.table_content>
            </div>

            <div id="table-content-color-secondary" class="demo-box">
              <TableContent.table_content
                color="secondary"
                variant="bordered"
                padding="small"
                rounded="medium"
              >
                <TableContent.content_item link_title="Section 1" link="#s1" />
                <TableContent.content_item link_title="Section 2" link="#s2" />
              </TableContent.table_content>
            </div>

            <div id="table-content-color-success" class="demo-box">
              <TableContent.table_content
                color="success"
                variant="outline"
                padding="small"
                rounded="medium"
              >
                <TableContent.content_item link_title="Section 1" link="#s1" />
                <TableContent.content_item link_title="Section 2" link="#s2" />
              </TableContent.table_content>
            </div>

            <div id="table-content-color-danger" class="demo-box">
              <TableContent.table_content
                color="danger"
                variant="default"
                padding="small"
                rounded="medium"
              >
                <TableContent.content_item link_title="Section 1" link="#s1" />
                <TableContent.content_item link_title="Section 2" link="#s2" />
              </TableContent.table_content>
            </div>
          </div>
        </div>

        <%!-- Item Slot Usage --%>
        <div id="table-content-slot" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Using Item Slot</h3>
          <div class="demo-box">
            <TableContent.table_content padding="small" rounded="medium">
              <:item link_title="Home" link="#home"></:item>
              <:item link_title="Overview" link="#overview"></:item>
              <:item link_title="Slots" link="#slots"></:item>
            </TableContent.table_content>
          </div>
        </div>

        <%!-- Animated --%>
        <div id="table-content-animated" class="demo-section space-y-4">
          <h3 class="demo-section-title text-lg font-semibold">Animated (Smooth Scroll)</h3>
          <div class="demo-box">
            <TableContent.table_content animated padding="small" rounded="medium">
              <TableContent.content_item link_title="Section A" link="#section-a" />
              <TableContent.content_item link_title="Section B" link="#section-b" />
              <TableContent.content_item link_title="Section C" link="#section-c" />
            </TableContent.table_content>
          </div>
        </div>

        <%!-- Usage Example --%>
        <div id="table-content-usage" class="demo-section demo-usage p-4 bg-base-200 rounded-lg">
          <h3 class="demo-section-title text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="demo-code text-sm overflow-x-auto"><code>&lt;TableContent.table_content title="On this page" padding="small" rounded="medium"&gt;
    &lt;TableContent.content_item link_title="Home" link="#home" /&gt;
    &lt;TableContent.content_item link_title="Overview" link="#overview" /&gt;

    &lt;TableContent.content_item title="Components"&gt;
    &lt;TableContent.content_wrapper&gt;
      &lt;TableContent.content_item icon="hero-chevron-right"&gt;
        &lt;.link patch="#buttons"&gt;Buttons&lt;/.link&gt;
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
