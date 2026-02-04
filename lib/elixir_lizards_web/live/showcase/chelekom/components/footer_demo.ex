defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.FooterDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.Footer

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Footer</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Customizable page footers with sections and layouts
        </p>
      </div>

      <div class="max-w-4xl mx-auto">
        <Footer.footer color="natural" padding="medium" rounded="large">
          <Footer.footer_section class="grid grid-cols-1 md:grid-cols-3 gap-6" padding="medium">
            <div>
              <h4 class="font-semibold mb-3">Company</h4>
              <ul class="space-y-2 text-sm">
                <li><a href="#" class="hover:underline">About Us</a></li>
                <li><a href="#" class="hover:underline">Careers</a></li>
              </ul>
            </div>
            <div>
              <h4 class="font-semibold mb-3">Support</h4>
              <ul class="space-y-2 text-sm">
                <li><a href="#" class="hover:underline">Help Center</a></li>
                <li><a href="#" class="hover:underline">Contact Us</a></li>
              </ul>
            </div>
            <div>
              <h4 class="font-semibold mb-3">Legal</h4>
              <ul class="space-y-2 text-sm">
                <li><a href="#" class="hover:underline">Privacy Policy</a></li>
                <li><a href="#" class="hover:underline">Terms of Service</a></li>
              </ul>
            </div>
          </Footer.footer_section>
          <Footer.footer_section text_position="center" class="border-t border-base-content/10" padding="small">
            <p class="text-sm">&copy; 2024 Elixir Lizards. All rights reserved.</p>
          </Footer.footer_section>
        </Footer.footer>
      </div>
    </div>
    """
  end
end
