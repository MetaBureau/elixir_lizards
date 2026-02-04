defmodule ElixirLizardsWeb.Demo.TeamLive do
  @moduledoc """
  Team demo page showcasing avatars, member cards, and team organization.
  """
  use ElixirLizardsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Team")
     |> assign(:team_members, sample_team_members())
     |> assign(:departments, sample_departments())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb>Team</:crumb>
      </.breadcrumb>

      <%!-- Header --%>
      <div class="text-center mb-12">
        <.badge variant="primary" class="mb-4">Our Team</.badge>
        <h1 class="text-4xl font-bold mb-4">Meet the people behind Elixir Lizards</h1>
        <p class="text-base-content/70 max-w-xl mx-auto">
          We're a diverse team of engineers, designers, and product thinkers
          passionate about building great developer tools.
        </p>
      </div>

      <%!-- Leadership Team --%>
      <div class="mb-16">
        <h2 class="text-2xl font-bold mb-8 text-center">Leadership</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div
            :for={member <- Enum.filter(@team_members, & &1.leadership)}
            class="card bg-base-100 card-border border-base-300 hover:shadow-lg transition-shadow"
          >
            <figure class="px-6 pt-6">
              <.avatar placeholder={member.initials} size="xl" />
            </figure>
            <div class="card-body items-center text-center">
              <h3 class="card-title">{member.name}</h3>
              <.badge variant={member.badge_variant}>{member.role}</.badge>
              <p class="text-base-content/70 text-sm mt-2">{member.bio}</p>
              <div class="flex gap-2 mt-4">
                <.tooltip content="Twitter">
                  <button class="btn btn-ghost btn-circle btn-sm">
                    <svg class="size-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                      <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
                    </svg>
                  </button>
                </.tooltip>
                <.tooltip content="LinkedIn">
                  <button class="btn btn-ghost btn-circle btn-sm">
                    <svg class="size-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                      <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
                    </svg>
                  </button>
                </.tooltip>
                <.tooltip content="GitHub">
                  <button class="btn btn-ghost btn-circle btn-sm">
                    <svg class="size-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                      <path
                        fill-rule="evenodd"
                        d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                        clip-rule="evenodd"
                      />
                    </svg>
                  </button>
                </.tooltip>
              </div>
            </div>
          </div>
        </div>
      </div>

      <%!-- Team by Department --%>
      <div class="mb-16">
        <h2 class="text-2xl font-bold mb-8 text-center">Our Departments</h2>
        <.tabs variant="boxed" class="justify-center mb-8">
          <:tab :for={dept <- @departments} active={dept.name == "Engineering"}>
            {dept.name}
          </:tab>
        </.tabs>

        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
          <div
            :for={member <- Enum.reject(@team_members, & &1.leadership)}
            class="card bg-base-100 card-compact card-border border-base-300 hover:border-primary/50 transition-colors"
          >
            <div class="card-body">
              <div class="flex items-center gap-3">
                <.avatar placeholder={member.initials} size="sm" />
                <div>
                  <h4 class="font-semibold">{member.name}</h4>
                  <p class="text-xs text-base-content/60">{member.role}</p>
                </div>
              </div>
              <div class="flex gap-1 mt-2">
                <.badge :for={skill <- member.skills} variant="ghost" size="xs">
                  {skill}
                </.badge>
              </div>
            </div>
          </div>
        </div>
      </div>

      <%!-- Team Stats --%>
      <div class="bg-base-200 rounded-box p-8 mb-16">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
          <div>
            <div class="text-4xl font-bold text-primary">25+</div>
            <div class="text-base-content/70">Team Members</div>
          </div>
          <div>
            <div class="text-4xl font-bold text-primary">8</div>
            <div class="text-base-content/70">Countries</div>
          </div>
          <div>
            <div class="text-4xl font-bold text-primary">100%</div>
            <div class="text-base-content/70">Remote</div>
          </div>
          <div>
            <div class="text-4xl font-bold text-primary">50%</div>
            <div class="text-base-content/70">Women in Tech</div>
          </div>
        </div>
      </div>

      <%!-- Join Us CTA --%>
      <div class="text-center py-12 bg-gradient-to-r from-primary/10 to-secondary/10 rounded-box">
        <.icon name="hero-sparkles" class="size-12 text-primary mx-auto mb-4" />
        <h2 class="text-2xl font-bold mb-4">Join our team</h2>
        <p class="text-base-content/70 mb-6 max-w-lg mx-auto">
          We're always looking for talented people to join our mission.
          Check out our open positions and apply today.
        </p>
        <.button variant="primary" class="btn-lg">
          <.icon name="hero-briefcase" class="size-5 mr-2" /> View Open Positions
        </.button>
      </div>
    </Layouts.app>
    """
  end

  defp sample_team_members do
    [
      %{
        name: "Alexandra Chen",
        initials: "AC",
        role: "CEO & Co-founder",
        bio: "Former VP of Engineering at TechCorp. 15+ years building developer tools.",
        leadership: true,
        badge_variant: "primary",
        skills: []
      },
      %{
        name: "Marcus Williams",
        initials: "MW",
        role: "CTO & Co-founder",
        bio: "Elixir enthusiast since 2015. Core contributor to several Hex packages.",
        leadership: true,
        badge_variant: "secondary",
        skills: []
      },
      %{
        name: "Sarah Park",
        initials: "SP",
        role: "Head of Design",
        bio: "Design leader with expertise in developer experience and tooling.",
        leadership: true,
        badge_variant: "accent",
        skills: []
      },
      %{
        name: "James Liu",
        initials: "JL",
        role: "Senior Engineer",
        bio: "",
        leadership: false,
        badge_variant: nil,
        skills: ["Elixir", "Phoenix", "OTP"]
      },
      %{
        name: "Emily Rodriguez",
        initials: "ER",
        role: "Senior Engineer",
        bio: "",
        leadership: false,
        badge_variant: nil,
        skills: ["Ash", "Ecto", "GraphQL"]
      },
      %{
        name: "David Kim",
        initials: "DK",
        role: "Product Designer",
        bio: "",
        leadership: false,
        badge_variant: nil,
        skills: ["UI/UX", "Figma", "CSS"]
      },
      %{
        name: "Anna Schmidt",
        initials: "AS",
        role: "DevRel Engineer",
        bio: "",
        leadership: false,
        badge_variant: nil,
        skills: ["Docs", "Community", "Elixir"]
      },
      %{
        name: "Michael Brown",
        initials: "MB",
        role: "Backend Engineer",
        bio: "",
        leadership: false,
        badge_variant: nil,
        skills: ["PostgreSQL", "Redis", "K8s"]
      },
      %{
        name: "Lisa Tanaka",
        initials: "LT",
        role: "Frontend Engineer",
        bio: "",
        leadership: false,
        badge_variant: nil,
        skills: ["LiveView", "Tailwind", "JS"]
      },
      %{
        name: "Chris Anderson",
        initials: "CA",
        role: "QA Engineer",
        bio: "",
        leadership: false,
        badge_variant: nil,
        skills: ["ExUnit", "Wallaby", "CI/CD"]
      },
      %{
        name: "Rachel Green",
        initials: "RG",
        role: "Product Manager",
        bio: "",
        leadership: false,
        badge_variant: nil,
        skills: ["Strategy", "Research", "Agile"]
      }
    ]
  end

  defp sample_departments do
    [
      %{name: "Engineering", count: 6},
      %{name: "Design", count: 3},
      %{name: "Product", count: 2},
      %{name: "Operations", count: 2}
    ]
  end
end
