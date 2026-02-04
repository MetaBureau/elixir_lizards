defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TypographyDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Typography

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Typography</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Styled headings and text elements for consistent typography
        </p>
      </div>

      <div class="max-w-4xl mx-auto space-y-8">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Headings</h3>
          <div class="space-y-4">
            <Typography.h1>Heading 1</Typography.h1>
            <Typography.h2>Heading 2</Typography.h2>
            <Typography.h3>Heading 3</Typography.h3>
            <Typography.h4>Heading 4</Typography.h4>
            <Typography.h5>Heading 5</Typography.h5>
            <Typography.h6>Heading 6</Typography.h6>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Paragraphs</h3>
          <Typography.p>
            This is a standard paragraph using the typography component.
            It provides consistent styling across your application and
            supports various customization options.
          </Typography.p>
          <Typography.p size="small">
            This is a smaller paragraph with reduced font size, useful
            for secondary content or captions.
          </Typography.p>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Color Variants</h3>
          <div class="space-y-2">
            <Typography.h4 color="primary">Primary Heading</Typography.h4>
            <Typography.h4 color="secondary">Secondary Heading</Typography.h4>
            <Typography.h4 color="success">Success Heading</Typography.h4>
            <Typography.h4 color="warning">Warning Heading</Typography.h4>
            <Typography.h4 color="danger">Danger Heading</Typography.h4>
            <Typography.h4 color="info">Info Heading</Typography.h4>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Font Weights</h3>
          <div class="space-y-2">
            <Typography.p font_weight="font-light">Light weight text</Typography.p>
            <Typography.p font_weight="font-normal">Normal weight text</Typography.p>
            <Typography.p font_weight="font-medium">Medium weight text</Typography.p>
            <Typography.p font_weight="font-semibold">Semibold weight text</Typography.p>
            <Typography.p font_weight="font-bold">Bold weight text</Typography.p>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Sizes</h3>
          <div class="space-y-2">
            <Typography.p size="extra_small">Extra small text</Typography.p>
            <Typography.p size="small">Small text</Typography.p>
            <Typography.p size="medium">Medium text</Typography.p>
            <Typography.p size="large">Large text</Typography.p>
            <Typography.p size="extra_large">Extra large text</Typography.p>
          </div>
        </div>

        <div class="space-y-4">
          <h3 class="text-lg font-semibold">Combined Example</h3>
          <article class="space-y-4">
            <Typography.h2 font_weight="font-bold">Article Title</Typography.h2>
            <Typography.p color="silver" size="small">Published on February 5, 2024</Typography.p>
            <Typography.p>
              This is an example of how typography components can be combined
              to create well-structured content. The components provide
              consistent styling while remaining flexible for customization.
            </Typography.p>
            <Typography.h4>Subheading</Typography.h4>
            <Typography.p>
              Additional content under the subheading demonstrates the
              hierarchy and visual structure that can be achieved.
            </Typography.p>
          </article>
        </div>

        <div class="p-4 bg-base-200 rounded-lg">
          <h3 class="text-lg font-semibold mb-2">Usage Example</h3>
          <pre class="text-sm overflow-x-auto"><code>&lt;Typography.h1&gt;Main Title&lt;/Typography.h1&gt;
    &lt;Typography.h2 color="primary"&gt;Colored Heading&lt;/Typography.h2&gt;
    &lt;Typography.p font_weight="font-semibold"&gt;Bold paragraph text&lt;/Typography.p&gt;
    &lt;Typography.p size="small" color="silver"&gt;Small muted text&lt;/Typography.p&gt;</code></pre>
        </div>
      </div>
    </div>
    """
  end
end
