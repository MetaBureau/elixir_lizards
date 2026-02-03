defmodule ElixirLizardsWeb.Demo.FeaturesLive do
  @moduledoc """
  Features demo page showcasing hero sections, feature cards, and testimonials.
  """
  use ElixirLizardsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Features")
     |> assign(:features, sample_features())
     |> assign(:testimonials, sample_testimonials())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <%!-- Hero Section --%>
      <div class="hero min-h-[60vh] bg-gradient-to-br from-primary/10 via-base-100 to-secondary/10 rounded-box">
        <div class="hero-content text-center">
          <div class="max-w-2xl">
            <.badge variant="primary" class="mb-4">New Release</.badge>
            <h1 class="text-5xl font-bold bg-gradient-to-r from-primary to-secondary bg-clip-text text-transparent">
              Build Amazing Apps
            </h1>
            <p class="py-6 text-lg text-base-content/70">
              Elixir Lizards provides everything you need to build modern, scalable web applications 
              with Phoenix and Ash Framework. Start shipping features faster with our comprehensive 
              component library and best practices.
            </p>
            <div class="flex flex-wrap gap-4 justify-center">
              <.button variant="primary" class="btn-lg">
                <.icon name="hero-rocket-launch" class="size-5 mr-2" />
                Get Started Free
              </.button>
              <.button class="btn-lg btn-outline">
                <.icon name="hero-play-circle" class="size-5 mr-2" />
                Watch Demo
              </.button>
            </div>
            <div class="flex items-center justify-center gap-8 mt-8 text-sm text-base-content/60">
              <div class="flex items-center gap-2">
                <.icon name="hero-check-circle" class="size-5 text-success" />
                Free trial
              </div>
              <div class="flex items-center gap-2">
                <.icon name="hero-check-circle" class="size-5 text-success" />
                No credit card
              </div>
              <div class="flex items-center gap-2">
                <.icon name="hero-check-circle" class="size-5 text-success" />
                Cancel anytime
              </div>
            </div>
          </div>
        </div>
      </div>

      <%!-- Features Grid --%>
      <div class="py-16">
        <div class="text-center mb-12">
          <.badge variant="secondary" class="mb-4">Features</.badge>
          <h2 class="text-3xl font-bold mb-4">Everything you need to succeed</h2>
          <p class="text-base-content/70 max-w-xl mx-auto">
            Our platform comes packed with powerful features designed to help you build, deploy, 
            and scale your applications with ease.
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <div
            :for={feature <- @features}
            class="card bg-base-100 card-border border-base-300 hover:shadow-lg hover:border-primary/50 transition-all duration-300"
          >
            <div class="card-body">
              <div class={["rounded-xl w-12 h-12 flex items-center justify-center mb-4", feature.bg_color]}>
                <.icon name={feature.icon} class={["size-6", feature.icon_color]} />
              </div>
              <h3 class="card-title text-lg">{feature.title}</h3>
              <p class="text-base-content/70">{feature.description}</p>
              <div class="card-actions justify-start mt-4">
                <.link class="link link-primary text-sm flex items-center gap-1">
                  Learn more <.icon name="hero-arrow-right" class="size-4" />
                </.link>
              </div>
            </div>
          </div>
        </div>
      </div>

      <%!-- Stats Banner --%>
      <div class="bg-gradient-to-r from-primary to-secondary rounded-box p-8 text-primary-content">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
          <div>
            <div class="text-4xl font-bold">10K+</div>
            <div class="text-primary-content/80">Active Users</div>
          </div>
          <div>
            <div class="text-4xl font-bold">50M+</div>
            <div class="text-primary-content/80">API Requests/mo</div>
          </div>
          <div>
            <div class="text-4xl font-bold">99.9%</div>
            <div class="text-primary-content/80">Uptime SLA</div>
          </div>
          <div>
            <div class="text-4xl font-bold">24/7</div>
            <div class="text-primary-content/80">Support</div>
          </div>
        </div>
      </div>

      <%!-- Testimonials --%>
      <div class="py-16">
        <div class="text-center mb-12">
          <.badge variant="accent" class="mb-4">Testimonials</.badge>
          <h2 class="text-3xl font-bold mb-4">Loved by developers</h2>
          <p class="text-base-content/70 max-w-xl mx-auto">
            See what our users have to say about their experience building with Elixir Lizards.
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
          <div
            :for={testimonial <- @testimonials}
            class="card bg-base-100 card-border border-base-300"
          >
            <div class="card-body">
              <div class="flex gap-1 mb-4">
                <.icon :for={_ <- 1..5} name="hero-star-solid" class="size-5 text-warning" />
              </div>
              <p class="italic text-base-content/80">"{testimonial.quote}"</p>
              <div class="flex items-center gap-3 mt-4 pt-4 border-t border-base-300">
                <.avatar placeholder={testimonial.initials} size="sm" />
                <div>
                  <div class="font-semibold">{testimonial.name}</div>
                  <div class="text-sm text-base-content/60">{testimonial.role}</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <%!-- CTA Section --%>
      <div class="text-center py-16 bg-base-200 rounded-box">
        <h2 class="text-3xl font-bold mb-4">Ready to get started?</h2>
        <p class="text-base-content/70 mb-8 max-w-xl mx-auto">
          Join thousands of developers who are already building with Elixir Lizards. 
          Start your free trial today.
        </p>
        <div class="flex flex-wrap gap-4 justify-center">
          <.button variant="primary" class="btn-lg">Start Free Trial</.button>
          <.button class="btn-lg btn-ghost">Contact Sales</.button>
        </div>
      </div>
    </Layouts.app>
    """
  end

  defp sample_features do
    [
      %{
        title: "Real-time Updates",
        description: "LiveView provides seamless real-time updates without writing any JavaScript. Watch your UI update instantly.",
        icon: "hero-bolt",
        bg_color: "bg-primary/10",
        icon_color: "text-primary"
      },
      %{
        title: "Ash Framework",
        description: "Build your domain model declaratively with Ash's powerful resource system and automatic API generation.",
        icon: "hero-cube-transparent",
        bg_color: "bg-secondary/10",
        icon_color: "text-secondary"
      },
      %{
        title: "Authentication",
        description: "Secure authentication out of the box with AshAuthentication. Magic links, OAuth, and more.",
        icon: "hero-shield-check",
        bg_color: "bg-success/10",
        icon_color: "text-success"
      },
      %{
        title: "Beautiful Components",
        description: "DaisyUI components styled with Tailwind CSS. Dark mode, themes, and responsive design included.",
        icon: "hero-paint-brush",
        bg_color: "bg-info/10",
        icon_color: "text-info"
      },
      %{
        title: "Scalable Architecture",
        description: "Built on OTP with supervision trees, fault tolerance, and horizontal scaling capabilities.",
        icon: "hero-server-stack",
        bg_color: "bg-warning/10",
        icon_color: "text-warning"
      },
      %{
        title: "Developer Experience",
        description: "Hot code reloading, excellent error messages, and a vibrant community to support you.",
        icon: "hero-code-bracket",
        bg_color: "bg-error/10",
        icon_color: "text-error"
      }
    ]
  end

  defp sample_testimonials do
    [
      %{
        quote: "Elixir Lizards cut our development time in half. The component library is incredibly well thought out.",
        name: "Sarah Chen",
        role: "CTO at TechStart",
        initials: "SC"
      },
      %{
        quote: "The Ash Framework integration is game-changing. We built a complete API in days, not weeks.",
        name: "Marcus Johnson",
        role: "Lead Developer at DataFlow",
        initials: "MJ"
      },
      %{
        quote: "Finally, a Phoenix starter that gets DaisyUI right. Beautiful UI with zero JavaScript headaches.",
        name: "Elena Rodriguez",
        role: "Full-stack Developer",
        initials: "ER"
      }
    ]
  end
end
