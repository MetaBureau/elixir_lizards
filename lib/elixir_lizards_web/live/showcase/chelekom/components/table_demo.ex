defmodule ElixirLizardsWeb.Showcase.Chelekom.Components.TableDemo do
  use ElixirLizardsWeb, :live_component

  alias ElixirLizardsWeb.Components.Chelekom.{Badge, Button, Table}

  def render(assigns) do
    ~H"""
    <div class="space-y-6">
      <div class="text-center">
        <h2 class="text-3xl font-bold mb-2">Table</h2>
        <p class="text-base-content/70 max-w-2xl mx-auto">
          Structured data display with headers, rows, and styling options
        </p>
      </div>

      <div class="max-w-4xl mx-auto">
        <Table.table rounded="medium" color="natural">
          <:header>Name</:header>
          <:header>Role</:header>
          <:header>Status</:header>
          <:header>Actions</:header>

          <Table.tr>
            <Table.td>Alice Johnson</Table.td>
            <Table.td>Developer</Table.td>
            <Table.td><Badge.badge color="success">Active</Badge.badge></Table.td>
            <Table.td><Button.button size="extra_small" variant="ghost">Edit</Button.button></Table.td>
          </Table.tr>

          <Table.tr>
            <Table.td>Bob Smith</Table.td>
            <Table.td>Designer</Table.td>
            <Table.td><Badge.badge color="warning">Away</Badge.badge></Table.td>
            <Table.td><Button.button size="extra_small" variant="ghost">Edit</Button.button></Table.td>
          </Table.tr>

          <Table.tr>
            <Table.td>Carol White</Table.td>
            <Table.td>Manager</Table.td>
            <Table.td><Badge.badge color="info">Meeting</Badge.badge></Table.td>
            <Table.td><Button.button size="extra_small" variant="ghost">Edit</Button.button></Table.td>
          </Table.tr>

          <:footer>Total: 3 team members</:footer>
        </Table.table>
      </div>
    </div>
    """
  end
end
