defmodule ElixirLizardsWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use ElixirLizardsWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
  Renders your app layout.

  This function is typically invoked from every template,
  and it often contains your application menu, sidebar,
  or similar.

  ## Examples

      <Layouts.app flash={@flash}>
        <h1>Content</h1>
      </Layouts.app>

  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <.navbar />

    <main class="px-4 py-10 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-6xl space-y-6">
        {render_slot(@inner_block)}
      </div>
    </main>

    <.flash_group flash={@flash} />

    <.site_footer />
    """
  end

  @doc """
  Renders the site navigation bar.

  Used by both the app layout and standalone pages like the home page.
  """
  def navbar(assigns) do
    ~H"""
    <header class="d-navbar px-4 sm:px-6 lg:px-8 bg-base-100/80 backdrop-blur-lg sticky top-0 z-50 border-b border-base-200">
      <div class="d-navbar-start">
        <a href="/" class="flex items-center gap-2">
          <img src={~p"/images/logo.svg"} width="36" alt="Elixir Lizards" />
          <span class="font-bold hidden sm:inline">Elixir Lizards</span>
        </a>
      </div>
      <div class="d-navbar-center hidden lg:flex">
        <ul class="d-menu d-menu-horizontal px-1 gap-1">
          <li><a href="/demo/features" class="rounded-lg">Features</a></li>
          <li><a href="/demo/pricing" class="rounded-lg">Pricing</a></li>
          <li><a href="/demo/team" class="rounded-lg">Team</a></li>
          <li><a href="/demo/contact" class="rounded-lg">Contact</a></li>
          <li><a href="/demo/mapbox" class="rounded-lg">Map</a></li>
          <li>
            <details class="d-dropdown">
              <summary class="rounded-lg">Resources</summary>
              <ul class="d-menu d-dropdown-content bg-base-100 d-rounded-box z-10 w-52 p-2 shadow-lg border border-base-200">
                <li><a href="/demo">All Demo Pages</a></li>
                <li><a href="/demo/dashboard">Dashboard</a></li>
                <li class="d-menu-title text-xs pt-2">Components</li>
                <li><a href="/showcase">All Components</a></li>
                <li><a href="/showcase/daisyui">DaisyUI</a></li>
                <li><a href="/showcase/chelekom">Mishka Chelekom</a></li>
                <li class="border-t border-base-200 mt-2 pt-2">
                  <a href="/admin">Admin Panel</a>
                </li>
              </ul>
            </details>
          </li>
        </ul>
      </div>
      <div class="d-navbar-end gap-2">
        <.theme_toggle />
        <a href="/sign-in" class="d-btn d-btn-ghost hidden sm:flex">Sign In</a>
        <a href="/demo" class="d-btn d-btn-primary d-btn-sm sm:btn-md">Get Started</a>
        <%!-- Mobile menu --%>
        <div class="d-dropdown d-dropdown-end lg:hidden">
          <div tabindex="0" role="button" class="d-btn d-btn-ghost d-btn-circle">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-5 w-5"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M4 6h16M4 12h8m-8 6h16"
              />
            </svg>
          </div>
          <ul
            tabindex="0"
            class="d-dropdown-content d-menu bg-base-100 d-rounded-box z-10 w-52 p-2 shadow-lg border border-base-200"
          >
            <li><a href="/demo">All Demos</a></li>
            <li><a href="/demo/features">Features</a></li>
            <li><a href="/demo/pricing">Pricing</a></li>
            <li><a href="/demo/team">Team</a></li>
            <li><a href="/demo/contact">Contact</a></li>
            <li><a href="/demo/mapbox">Map</a></li>
            <li><a href="/demo/dashboard">Dashboard</a></li>
            <li class="border-t border-base-200 mt-2 pt-2">
              <span class="d-menu-title text-xs">Components</span>
            </li>
            <li><a href="/showcase">All Components</a></li>
            <li><a href="/showcase/daisyui">DaisyUI</a></li>
            <li><a href="/showcase/chelekom">Chelekom</a></li>
            <li class="border-t border-base-200 mt-2 pt-2">
              <a href="/sign-in">Sign In</a>
            </li>
          </ul>
        </div>
      </div>
    </header>
    """
  end

  @doc """
  Renders the site footer.

  Used by both the app layout and standalone pages like the home page.
  """
  def site_footer(assigns) do
    ~H"""
    <footer class="d-footer d-footer-center p-10 bg-base-200 text-base-content">
      <nav class="grid grid-flow-col gap-4">
        <a href="/demo/features" class="d-link d-link-hover">Features</a>
        <a href="/demo/pricing" class="d-link d-link-hover">Pricing</a>
        <a href="/demo/team" class="d-link d-link-hover">Team</a>
        <a href="/demo/contact" class="d-link d-link-hover">Contact</a>
        <a href="/demo/mapbox" class="d-link d-link-hover">Map</a>
        <a href="/showcase" class="d-link d-link-hover">Components</a>
      </nav>
      <nav>
        <div class="grid grid-flow-col gap-4">
          <a href="https://github.com/phoenixframework/phoenix" class="d-btn d-btn-ghost d-btn-circle">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              class="fill-current"
            >
              <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
            </svg>
          </a>
          <a href="https://discord.gg/elixir" class="d-btn d-btn-ghost d-btn-circle">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              class="fill-current"
            >
              <path d="M20.317 4.3698a19.7913 19.7913 0 00-4.8851-1.5152.0741.0741 0 00-.0785.0371c-.211.3753-.4447.8648-.6083 1.2495-1.8447-.2762-3.68-.2762-5.4868 0-.1636-.3933-.4058-.8742-.6177-1.2495a.077.077 0 00-.0785-.037 19.7363 19.7363 0 00-4.8852 1.515.0699.0699 0 00-.0321.0277C.5334 9.0458-.319 13.5799.0992 18.0578a.0824.0824 0 00.0312.0561c2.0528 1.5076 4.0413 2.4228 5.9929 3.0294a.0777.0777 0 00.0842-.0276c.4616-.6304.8731-1.2952 1.226-1.9942a.076.076 0 00-.0416-.1057c-.6528-.2476-1.2743-.5495-1.8722-.8923a.077.077 0 01-.0076-.1277c.1258-.0943.2517-.1923.3718-.2914a.0743.0743 0 01.0776-.0105c3.9278 1.7933 8.18 1.7933 12.0614 0a.0739.0739 0 01.0785.0095c.1202.099.246.1981.3728.2924a.077.077 0 01-.0066.1276 12.2986 12.2986 0 01-1.873.8914.0766.0766 0 00-.0407.1067c.3604.698.7719 1.3628 1.225 1.9932a.076.076 0 00.0842.0286c1.961-.6067 3.9495-1.5219 6.0023-3.0294a.077.077 0 00.0313-.0552c.5004-5.177-.8382-9.6739-3.5485-13.6604a.061.061 0 00-.0312-.0286zM8.02 15.3312c-1.1825 0-2.1569-1.0857-2.1569-2.419 0-1.3332.9555-2.4189 2.157-2.4189 1.2108 0 2.1757 1.0952 2.1568 2.419 0 1.3332-.9555 2.4189-2.1569 2.4189zm7.9748 0c-1.1825 0-2.1569-1.0857-2.1569-2.419 0-1.3332.9554-2.4189 2.1569-2.4189 1.2108 0 2.1757 1.0952 2.1568 2.419 0 1.3332-.946 2.4189-2.1568 2.4189Z" />
            </svg>
          </a>
          <a href="https://elixirforum.com" class="d-btn d-btn-ghost d-btn-circle">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              class="fill-current"
            >
              <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z" />
            </svg>
          </a>
        </div>
      </nav>
      <aside>
        <p>Built with Phoenix, Ash Framework, and DaisyUI</p>
        <p class="text-sm text-base-content/60">
          A demo project showcasing modern Elixir web development
        </p>
      </aside>
    </footer>
    """
  end

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} />
      <.flash kind={:error} flash={@flash} />

      <.flash
        id={"#{@id}-client-error"}
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={
          show(".phx-client-error ##{@id}-client-error") |> JS.remove_attribute("hidden")
        }
        phx-connected={hide("##{@id}-client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id={"#{@id}-server-error"}
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={
          show(".phx-server-error ##{@id}-server-error") |> JS.remove_attribute("hidden")
        }
        phx-connected={hide("##{@id}-server-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end

  @doc """
  Provides dark vs light theme toggle based on themes defined in app.css.

  See <head> in root.html.heex which applies the theme before page load.
  """
  def theme_toggle(assigns) do
    ~H"""
    <div class="d-card relative flex flex-row items-center border-2 border-base-300 bg-base-300 rounded-full">
      <div class="absolute w-1/3 h-full rounded-full border-1 border-base-200 bg-base-100 brightness-200 left-0 [[data-theme=light]_&]:left-1/3 [[data-theme=dark]_&]:left-2/3 transition-[left]" />

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="system"
      >
        <.icon name="hero-computer-desktop-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="light"
      >
        <.icon name="hero-sun-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>

      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="dark"
      >
        <.icon name="hero-moon-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>
    </div>
    """
  end
end
