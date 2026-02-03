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
    <header class="navbar px-4 sm:px-6 lg:px-8 bg-base-100/80 backdrop-blur-lg sticky top-0 z-50 border-b border-base-200">
      <div class="navbar-start">
        <a href="/" class="flex items-center gap-2">
          <img src={~p"/images/logo.svg"} width="36" />
          <span class="font-bold hidden sm:inline">Elixir Lizards</span>
        </a>
      </div>
      <div class="navbar-center hidden lg:flex">
        <ul class="menu menu-horizontal px-1 gap-1">
          <li><a href="/demo/features" class="rounded-lg">Features</a></li>
          <li><a href="/demo/pricing" class="rounded-lg">Pricing</a></li>
          <li><a href="/demo/team" class="rounded-lg">Team</a></li>
          <li><a href="/demo/contact" class="rounded-lg">Contact</a></li>
          <li><a href="/demo/mapbox" class="rounded-lg">Map</a></li>
          <li>
            <details class="dropdown">
              <summary class="rounded-lg">Resources</summary>
              <ul class="menu dropdown-content bg-base-100 rounded-box z-10 w-52 p-2 shadow-lg border border-base-200">
                <li><a href="/demo">All Demo Pages</a></li>
                <li><a href="/demo/dashboard">Dashboard</a></li>
                <li><a href="/dev/components">Component Library</a></li>
                <li><a href="/admin">Admin Panel</a></li>
              </ul>
            </details>
          </li>
        </ul>
      </div>
      <div class="navbar-end gap-2">
        <.theme_toggle />
        <a href="/sign-in" class="btn btn-ghost hidden sm:flex">Sign In</a>
        <a href="/demo" class="btn btn-primary btn-sm sm:btn-md">Get Started</a>
        <%!-- Mobile menu --%>
        <div class="dropdown dropdown-end lg:hidden">
          <div tabindex="0" role="button" class="btn btn-ghost btn-circle">
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
            class="dropdown-content menu bg-base-100 rounded-box z-10 w-52 p-2 shadow-lg border border-base-200"
          >
            <li><a href="/demo">All Demos</a></li>
            <li><a href="/demo/features">Features</a></li>
            <li><a href="/demo/pricing">Pricing</a></li>
            <li><a href="/demo/team">Team</a></li>
            <li><a href="/demo/contact">Contact</a></li>
            <li><a href="/demo/mapbox">Map</a></li>
            <li><a href="/demo/dashboard">Dashboard</a></li>
            <li class="border-t border-base-200 mt-2 pt-2">
              <a href="/dev/components">Components</a>
            </li>
            <li><a href="/sign-in">Sign In</a></li>
          </ul>
        </div>
      </div>
    </header>

    <main class="px-4 py-10 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-6xl space-y-6">
        {render_slot(@inner_block)}
      </div>
    </main>

    <.flash_group flash={@flash} />

    <footer class="footer footer-center p-6 bg-base-200 text-base-content mt-auto">
      <nav class="grid grid-flow-col gap-4 text-sm">
        <a href="/demo/features" class="link link-hover">Features</a>
        <a href="/demo/pricing" class="link link-hover">Pricing</a>
        <a href="/demo/team" class="link link-hover">Team</a>
        <a href="/demo/contact" class="link link-hover">Contact</a>
        <a href="/demo/mapbox" class="link link-hover">Map</a>
        <a href="/dev/components" class="link link-hover">Components</a>
      </nav>
      <aside class="text-xs text-base-content/60">
        Built with Phoenix, Ash Framework, and DaisyUI
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
        id="client-error"
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={show(".phx-server-error #server-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#server-error") |> JS.set_attribute({"hidden", ""})}
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
    <div class="card relative flex flex-row items-center border-2 border-base-300 bg-base-300 rounded-full">
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
