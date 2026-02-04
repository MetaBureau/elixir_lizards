defmodule ElixirLizardsWeb.ComponentIndexLive do
  @moduledoc """
  Index page for component library demos.
  """
  use ElixirLizardsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :page_title, "Component Libraries")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb>Components</:crumb>
      </.breadcrumb>

      <.header>
        Component Libraries
        <:subtitle>Explore our UI component collections for Phoenix LiveView</:subtitle>
      </.header>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-8">
        <a
          href="/dev/components/daisyui"
          class="card bg-base-100 card-border border-base-300 hover:shadow-xl hover:border-primary transition-all duration-300 group"
        >
          <div class="card-body">
            <div class="flex items-center gap-4 mb-4">
              <div class="rounded-xl bg-primary/10 p-4">
                <.icon name="hero-paint-brush" class="size-8 text-primary" />
              </div>
              <div>
                <h2 class="card-title text-2xl group-hover:text-primary transition-colors">
                  DaisyUI
                </h2>
                <.badge variant="primary" size="sm">14 Components</.badge>
              </div>
            </div>
            <p class="text-base-content/70 mb-4">
              Tailwind CSS component library with semantic class names.
              Clean, customizable components that work seamlessly with our design system.
            </p>
            <ul class="text-sm text-base-content/60 space-y-1 mb-4">
              <li class="flex items-center gap-2">
                <.icon name="hero-check" class="size-4 text-success" /> Button, Badge, Card, Modal
              </li>
              <li class="flex items-center gap-2">
                <.icon name="hero-check" class="size-4 text-success" /> Avatar, Dropdown, Tabs
              </li>
              <li class="flex items-center gap-2">
                <.icon name="hero-check" class="size-4 text-success" /> Table, Stat, Tooltip
              </li>
            </ul>
            <div class="card-actions justify-end">
              <span class="text-primary flex items-center gap-1 group-hover:gap-2 transition-all">
                Explore Components <.icon name="hero-arrow-right" class="size-4" />
              </span>
            </div>
          </div>
        </a>

        <a
          href="/dev/components/chelekom"
          class="card bg-base-100 card-border border-base-300 hover:shadow-xl hover:border-secondary transition-all duration-300 group"
        >
          <div class="card-body">
            <div class="flex items-center gap-4 mb-4">
              <div class="rounded-xl bg-secondary/10 p-4">
                <.icon name="hero-cube-transparent" class="size-8 text-secondary" />
              </div>
              <div>
                <h2 class="card-title text-2xl group-hover:text-secondary transition-colors">
                  Mishka Chelekom
                </h2>
                <.badge variant="secondary" size="sm">22 Components</.badge>
              </div>
            </div>
            <p class="text-base-content/70 mb-4">
              Zero-configuration UI components for Phoenix LiveView.
              Modern, customizable components with multiple variants and styles.
            </p>
            <ul class="text-sm text-base-content/60 space-y-1 mb-4">
              <li class="flex items-center gap-2">
                <.icon name="hero-check" class="size-4 text-success" /> Alert, Accordion, Modal, Drawer
              </li>
              <li class="flex items-center gap-2">
                <.icon name="hero-check" class="size-4 text-success" /> Progress, Spinner, Rating
              </li>
              <li class="flex items-center gap-2">
                <.icon name="hero-check" class="size-4 text-success" /> Table, Tabs, Pagination
              </li>
            </ul>
            <div class="card-actions justify-end">
              <span class="text-secondary flex items-center gap-1 group-hover:gap-2 transition-all">
                Explore Components <.icon name="hero-arrow-right" class="size-4" />
              </span>
            </div>
          </div>
        </a>
      </div>

      <div class="mt-12 p-6 bg-base-200 rounded-box">
        <h3 class="text-lg font-semibold mb-4">Quick Comparison</h3>
        <div class="overflow-x-auto">
          <table class="table">
            <thead>
              <tr>
                <th>Feature</th>
                <th>DaisyUI</th>
                <th>Mishka Chelekom</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Styling Approach</td>
                <td>Tailwind CSS classes</td>
                <td>Zero-config with variants</td>
              </tr>
              <tr>
                <td>Component Count</td>
                <td>14 components</td>
                <td>22 components</td>
              </tr>
              <tr>
                <td>Best For</td>
                <td>Quick prototyping, familiar Tailwind</td>
                <td>Full-featured, customizable apps</td>
              </tr>
              <tr>
                <td>JavaScript</td>
                <td>Minimal (LiveView only)</td>
                <td>Minimal (LiveView only)</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </Layouts.app>
    """
  end
end
