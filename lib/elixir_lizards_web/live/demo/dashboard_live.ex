defmodule ElixirLizardsWeb.Demo.DashboardLive do
  @moduledoc """
  Dashboard demo page showcasing stats, cards, tables and activity feeds.
  """
  use ElixirLizardsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Dashboard")
     |> assign(:stats, sample_stats())
     |> assign(:recent_activity, sample_activity())
     |> assign(:projects, sample_projects())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb>Dashboard</:crumb>
      </.breadcrumb>

      <.header>
        Dashboard
        <:subtitle>Welcome back! Here's what's happening with your projects.</:subtitle>
        <:actions>
          <.button variant="primary">
            <.icon name="hero-plus" class="size-4 mr-1" /> New Project
          </.button>
        </:actions>
      </.header>

      <%!-- Stats Section --%>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <div :for={stat <- @stats} class="stat bg-base-100 rounded-box shadow">
          <div class={["stat-figure", stat.color]}>
            <.icon name={stat.icon} class="size-8" />
          </div>
          <div class="stat-title">{stat.title}</div>
          <div class={["stat-value", stat.color]}>{stat.value}</div>
          <div class="stat-desc">{stat.description}</div>
        </div>
      </div>

      <%!-- Main Content Grid --%>
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mt-8">
        <%!-- Projects Table --%>
        <div class="lg:col-span-2">
          <.card variant="bordered">
            <:title>
              <div class="flex items-center justify-between w-full">
                <span>Recent Projects</span>
                <.badge variant="primary" size="sm">{length(@projects)} active</.badge>
              </div>
            </:title>
            <:body>
              <div class="overflow-x-auto">
                <table class="table table-zebra">
                  <thead>
                    <tr>
                      <th>Project</th>
                      <th>Status</th>
                      <th>Progress</th>
                      <th>Team</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr :for={project <- @projects}>
                      <td>
                        <div class="flex items-center gap-3">
                          <div class={["rounded-lg p-2", project.bg_color]}>
                            <.icon name={project.icon} class="size-5" />
                          </div>
                          <div>
                            <div class="font-bold">{project.name}</div>
                            <div class="text-sm opacity-50">{project.category}</div>
                          </div>
                        </div>
                      </td>
                      <td>
                        <.badge variant={project.status_variant} size="sm">
                          {project.status}
                        </.badge>
                      </td>
                      <td>
                        <div class="flex items-center gap-2">
                          <progress
                            class={["progress w-20", "progress-#{project.status_variant}"]}
                            value={project.progress}
                            max="100"
                          >
                          </progress>
                          <span class="text-sm">{project.progress}%</span>
                        </div>
                      </td>
                      <td>
                        <div class="avatar-group -space-x-4">
                          <div :for={member <- project.team} class="avatar">
                            <div class="w-8">
                              <div class="bg-neutral text-neutral-content flex items-center justify-center w-full h-full text-xs rounded-full">
                                {member}
                              </div>
                            </div>
                          </div>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </:body>
          </.card>
        </div>

        <%!-- Activity Feed --%>
        <div class="lg:col-span-1">
          <.card variant="bordered">
            <:title>
              <div class="flex items-center gap-2">
                <.icon name="hero-bell" class="size-5" />
                Recent Activity
              </div>
            </:title>
            <:body>
              <ul class="timeline timeline-vertical timeline-compact">
                <li :for={{activity, idx} <- Enum.with_index(@recent_activity)}>
                  <hr :if={idx > 0} />
                  <div class="timeline-middle">
                    <div class={["rounded-full p-1", activity.bg_color]}>
                      <.icon name={activity.icon} class="size-3 text-white" />
                    </div>
                  </div>
                  <div class="timeline-end timeline-box">
                    <div class="font-medium text-sm">{activity.title}</div>
                    <div class="text-xs text-base-content/70">{activity.time}</div>
                  </div>
                  <hr :if={idx < length(@recent_activity) - 1} />
                </li>
              </ul>
            </:body>
          </.card>
        </div>
      </div>

      <%!-- Quick Actions --%>
      <div class="mt-8">
        <h3 class="text-lg font-semibold mb-4">Quick Actions</h3>
        <div class="flex flex-wrap gap-2">
          <.button>
            <.icon name="hero-document-plus" class="size-4 mr-2" /> New Document
          </.button>
          <.button>
            <.icon name="hero-user-plus" class="size-4 mr-2" /> Invite Team Member
          </.button>
          <.button>
            <.icon name="hero-chart-bar" class="size-4 mr-2" /> View Analytics
          </.button>
          <.button>
            <.icon name="hero-cog-6-tooth" class="size-4 mr-2" /> Settings
          </.button>
        </div>
      </div>
    </Layouts.app>
    """
  end

  defp sample_stats do
    [
      %{
        title: "Total Revenue",
        value: "$45,231",
        description: "↗︎ 12% from last month",
        icon: "hero-currency-dollar",
        color: "text-success"
      },
      %{
        title: "Active Users",
        value: "2,350",
        description: "↗︎ 5% from last week",
        icon: "hero-users",
        color: "text-info"
      },
      %{
        title: "Projects",
        value: "12",
        description: "3 due this week",
        icon: "hero-folder",
        color: "text-warning"
      },
      %{
        title: "Tasks Completed",
        value: "89%",
        description: "45 of 51 tasks",
        icon: "hero-check-circle",
        color: "text-primary"
      }
    ]
  end

  defp sample_activity do
    [
      %{
        title: "New user registered",
        time: "2 minutes ago",
        icon: "hero-user-plus",
        bg_color: "bg-success"
      },
      %{
        title: "Project deployed",
        time: "1 hour ago",
        icon: "hero-rocket-launch",
        bg_color: "bg-info"
      },
      %{
        title: "Payment received",
        time: "3 hours ago",
        icon: "hero-credit-card",
        bg_color: "bg-primary"
      },
      %{
        title: "Bug report filed",
        time: "5 hours ago",
        icon: "hero-bug-ant",
        bg_color: "bg-warning"
      },
      %{
        title: "New comment",
        time: "Yesterday",
        icon: "hero-chat-bubble-left",
        bg_color: "bg-secondary"
      }
    ]
  end

  defp sample_projects do
    [
      %{
        name: "Phoenix Dashboard",
        category: "Web Application",
        status: "Active",
        status_variant: "success",
        progress: 75,
        icon: "hero-fire",
        bg_color: "bg-primary/10 text-primary",
        team: ["JD", "SK", "MR"]
      },
      %{
        name: "Mobile App",
        category: "iOS & Android",
        status: "In Progress",
        status_variant: "info",
        progress: 45,
        icon: "hero-device-phone-mobile",
        bg_color: "bg-info/10 text-info",
        team: ["AB", "CD"]
      },
      %{
        name: "API Integration",
        category: "Backend",
        status: "Review",
        status_variant: "warning",
        progress: 90,
        icon: "hero-server",
        bg_color: "bg-warning/10 text-warning",
        team: ["EF", "GH", "IJ", "KL"]
      },
      %{
        name: "Documentation",
        category: "Content",
        status: "Active",
        status_variant: "success",
        progress: 30,
        icon: "hero-document-text",
        bg_color: "bg-success/10 text-success",
        team: ["MN"]
      }
    ]
  end
end
