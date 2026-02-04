defmodule ElixirLizardsWeb.Demo.ContactLive do
  @moduledoc """
  Contact demo page showcasing forms, inputs, and validation patterns.
  """
  use ElixirLizardsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Contact")
     |> assign(:form, to_form(%{"name" => "", "email" => "", "subject" => "", "message" => ""}))
     |> assign(:submitted, false)}
  end

  @impl true
  def handle_event("validate", %{"contact" => params}, socket) do
    # In a real app, you'd validate against a changeset
    {:noreply, assign(socket, :form, to_form(params, as: "contact"))}
  end

  @impl true
  def handle_event("submit", %{"contact" => _params}, socket) do
    # In a real app, you'd submit to your backend
    {:noreply,
     socket
     |> assign(:submitted, true)
     |> put_flash(:info, "Thank you for your message! We'll get back to you soon.")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb>Contact</:crumb>
      </.breadcrumb>

      <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
        <%!-- Contact Form --%>
        <div>
          <.badge variant="primary" class="mb-4">Contact Us</.badge>
          <h1 class="text-3xl font-bold mb-4">Get in touch</h1>
          <p class="text-base-content/70 mb-8">
            Have a question or want to work with us? Fill out the form below
            and we'll get back to you within 24 hours.
          </p>

          <.form
            for={@form}
            id="contact-form"
            phx-change="validate"
            phx-submit="submit"
            class="space-y-6"
          >
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
              <.input
                field={@form[:name]}
                label="Your Name"
                placeholder="John Doe"
                required
              />
              <.input
                field={@form[:email]}
                type="email"
                label="Email Address"
                placeholder="john@example.com"
                required
              />
            </div>

            <.input
              field={@form[:subject]}
              type="select"
              label="Subject"
              prompt="Select a topic..."
              options={[
                "General Inquiry",
                "Sales Question",
                "Technical Support",
                "Partnership Opportunity",
                "Feedback"
              ]}
              required
            />

            <.input
              field={@form[:message]}
              type="textarea"
              label="Message"
              placeholder="Tell us how we can help..."
              rows={5}
              required
            />

            <div class="flex items-center gap-4">
              <.button type="submit" variant="primary" class="btn-lg">
                <.icon name="hero-paper-airplane" class="size-5 mr-2" /> Send Message
              </.button>
              <span class="text-sm text-base-content/60">
                We typically respond within 24 hours
              </span>
            </div>
          </.form>
        </div>

        <%!-- Contact Info --%>
        <div class="space-y-8">
          <%!-- Quick Contact Cards --%>
          <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div class="card bg-base-100 card-border border-base-300">
              <div class="card-body">
                <div class="rounded-lg bg-primary/10 w-12 h-12 flex items-center justify-center mb-3">
                  <.icon name="hero-envelope" class="size-6 text-primary" />
                </div>
                <h3 class="font-semibold">Email Us</h3>
                <p class="text-sm text-base-content/70">Our team is here to help.</p>
                <a href="mailto:hello@elixirlizards.com" class="link link-primary text-sm">
                  hello@elixirlizards.com
                </a>
              </div>
            </div>

            <div class="card bg-base-100 card-border border-base-300">
              <div class="card-body">
                <div class="rounded-lg bg-secondary/10 w-12 h-12 flex items-center justify-center mb-3">
                  <.icon name="hero-chat-bubble-left-right" class="size-6 text-secondary" />
                </div>
                <h3 class="font-semibold">Live Chat</h3>
                <p class="text-sm text-base-content/70">Available 9am-5pm EST.</p>
                <button class="link link-secondary text-sm text-left">
                  Start a conversation →
                </button>
              </div>
            </div>

            <div class="card bg-base-100 card-border border-base-300">
              <div class="card-body">
                <div class="rounded-lg bg-success/10 w-12 h-12 flex items-center justify-center mb-3">
                  <.icon name="hero-phone" class="size-6 text-success" />
                </div>
                <h3 class="font-semibold">Phone</h3>
                <p class="text-sm text-base-content/70">Mon-Fri from 9am-5pm EST.</p>
                <a href="tel:+1-555-123-4567" class="link link-success text-sm">
                  +1 (555) 123-4567
                </a>
              </div>
            </div>

            <div class="card bg-base-100 card-border border-base-300">
              <div class="card-body">
                <div class="rounded-lg bg-warning/10 w-12 h-12 flex items-center justify-center mb-3">
                  <.icon name="hero-map-pin" class="size-6 text-warning" />
                </div>
                <h3 class="font-semibold">Office</h3>
                <p class="text-sm text-base-content/70">Come visit our office.</p>
                <span class="text-sm">
                  123 Tech Street<br />San Francisco, CA 94107
                </span>
              </div>
            </div>
          </div>

          <%!-- Social Links --%>
          <div class="card bg-base-200">
            <div class="card-body">
              <h3 class="font-semibold mb-4">Follow us</h3>
              <div class="flex gap-4">
                <.tooltip content="Twitter/X">
                  <a href="#" class="btn btn-circle btn-ghost">
                    <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                      <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
                    </svg>
                  </a>
                </.tooltip>
                <.tooltip content="GitHub">
                  <a href="#" class="btn btn-circle btn-ghost">
                    <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                      <path
                        fill-rule="evenodd"
                        d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                        clip-rule="evenodd"
                      />
                    </svg>
                  </a>
                </.tooltip>
                <.tooltip content="Discord">
                  <a href="#" class="btn btn-circle btn-ghost">
                    <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                      <path d="M20.317 4.3698a19.7913 19.7913 0 00-4.8851-1.5152.0741.0741 0 00-.0785.0371c-.211.3753-.4447.8648-.6083 1.2495-1.8447-.2762-3.68-.2762-5.4868 0-.1636-.3933-.4058-.8742-.6177-1.2495a.077.077 0 00-.0785-.037 19.7363 19.7363 0 00-4.8852 1.515.0699.0699 0 00-.0321.0277C.5334 9.0458-.319 13.5799.0992 18.0578a.0824.0824 0 00.0312.0561c2.0528 1.5076 4.0413 2.4228 5.9929 3.0294a.0777.0777 0 00.0842-.0276c.4616-.6304.8731-1.2952 1.226-1.9942a.076.076 0 00-.0416-.1057c-.6528-.2476-1.2743-.5495-1.8722-.8923a.077.077 0 01-.0076-.1277c.1258-.0943.2517-.1923.3718-.2914a.0743.0743 0 01.0776-.0105c3.9278 1.7933 8.18 1.7933 12.0614 0a.0739.0739 0 01.0785.0095c.1202.099.246.1981.3728.2924a.077.077 0 01-.0066.1276 12.2986 12.2986 0 01-1.873.8914.0766.0766 0 00-.0407.1067c.3604.698.7719 1.3628 1.225 1.9932a.076.076 0 00.0842.0286c1.961-.6067 3.9495-1.5219 6.0023-3.0294a.077.077 0 00.0313-.0552c.5004-5.177-.8382-9.6739-3.5485-13.6604a.061.061 0 00-.0312-.0286zM8.02 15.3312c-1.1825 0-2.1569-1.0857-2.1569-2.419 0-1.3332.9555-2.4189 2.157-2.4189 1.2108 0 2.1757 1.0952 2.1568 2.419 0 1.3332-.9555 2.4189-2.1569 2.4189zm7.9748 0c-1.1825 0-2.1569-1.0857-2.1569-2.419 0-1.3332.9554-2.4189 2.1569-2.4189 1.2108 0 2.1757 1.0952 2.1568 2.419 0 1.3332-.946 2.4189-2.1568 2.4189Z" />
                    </svg>
                  </a>
                </.tooltip>
                <.tooltip content="LinkedIn">
                  <a href="#" class="btn btn-circle btn-ghost">
                    <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                      <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
                    </svg>
                  </a>
                </.tooltip>
                <.tooltip content="YouTube">
                  <a href="#" class="btn btn-circle btn-ghost">
                    <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                      <path
                        fill-rule="evenodd"
                        d="M19.812 5.418c.861.23 1.538.907 1.768 1.768C21.998 8.746 22 12 22 12s0 3.255-.418 4.814a2.504 2.504 0 0 1-1.768 1.768c-1.56.419-7.814.419-7.814.419s-6.255 0-7.814-.419a2.505 2.505 0 0 1-1.768-1.768C2 15.255 2 12 2 12s0-3.255.417-4.814a2.507 2.507 0 0 1 1.768-1.768C5.744 5 11.998 5 11.998 5s6.255 0 7.814.418ZM15.194 12 10 15V9l5.194 3Z"
                        clip-rule="evenodd"
                      />
                    </svg>
                  </a>
                </.tooltip>
              </div>
            </div>
          </div>

          <%!-- FAQ Teaser --%>
          <div class="card bg-base-100 card-border border-base-300">
            <div class="card-body">
              <div class="flex items-start gap-4">
                <div class="rounded-lg bg-info/10 p-3">
                  <.icon name="hero-question-mark-circle" class="size-6 text-info" />
                </div>
                <div>
                  <h3 class="font-semibold">Looking for answers?</h3>
                  <p class="text-sm text-base-content/70 mb-3">
                    Check out our FAQ section for quick answers to common questions.
                  </p>
                  <.link navigate={~p"/demo/pricing"} class="btn btn-sm btn-ghost">
                    View FAQ <.icon name="hero-arrow-right" class="size-4 ml-1" />
                  </.link>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <%!-- Map Placeholder --%>
      <div class="mt-12">
        <div class="rounded-box bg-base-200 h-64 flex items-center justify-center">
          <div class="text-center">
            <.icon name="hero-map" class="size-12 text-base-content/30 mx-auto mb-2" />
            <p class="text-base-content/50">Interactive map would go here</p>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end
end
