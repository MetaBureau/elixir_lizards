defmodule ElixirLizardsWeb.Showcase.DaisyUI.Pages.PricingLive do
  @moduledoc """
  Pricing demo page showcasing pricing cards, comparison tables, and FAQ.
  """
  use ElixirLizardsWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Pricing")
     |> assign(:billing_period, :monthly)
     |> assign(:plans, sample_plans())
     |> assign(:faqs, sample_faqs())}
  end

  @impl true
  def handle_event("toggle_billing", %{"period" => period}, socket) do
    {:noreply, assign(socket, :billing_period, String.to_existing_atom(period))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.breadcrumb>
        <:crumb navigate={~p"/"}>Home</:crumb>
        <:crumb>Pricing</:crumb>
      </.breadcrumb>

      <%!-- Header --%>
      <div class="text-center mb-12">
        <.badge variant="primary" class="mb-4">Pricing</.badge>
        <h1 class="text-4xl font-bold mb-4">Simple, transparent pricing</h1>
        <p class="text-base-content/70 max-w-xl mx-auto mb-8">
          Choose the plan that fits your needs. All plans include a 14-day free trial.
          No credit card required.
        </p>

        <%!-- Billing Toggle --%>
        <div class="flex items-center justify-center gap-4">
          <span class={[@billing_period == :monthly && "font-semibold"]}>Monthly</span>
          <input
            type="checkbox"
            class="d-toggle d-toggle-primary"
            checked={@billing_period == :yearly}
            phx-click="toggle_billing"
            phx-value-period={if @billing_period == :monthly, do: "yearly", else: "monthly"}
          />
          <span class={[@billing_period == :yearly && "font-semibold"]}>
            Yearly
            <.badge variant="success" size="sm">Save 20%</.badge>
          </span>
        </div>
      </div>

      <%!-- Pricing Cards --%>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8 mb-16">
        <div
          :for={plan <- @plans}
          class={[
            "d-card bg-base-100",
            plan.featured && "card-border-2 border-primary shadow-lg scale-105",
            !plan.featured && "d-card-border border-base-300"
          ]}
        >
          <div class="d-card-body">
            <div class="flex items-center justify-between">
              <h3 class="d-card-title">{plan.name}</h3>
              <.badge :if={plan.featured} variant="primary">Popular</.badge>
            </div>
            <p class="text-base-content/70 text-sm">{plan.description}</p>

            <div class="my-6">
              <span class="text-4xl font-bold">
                ${if @billing_period == :yearly, do: plan.yearly_price, else: plan.monthly_price}
              </span>
              <span class="text-base-content/60">/month</span>
              <div :if={@billing_period == :yearly} class="text-sm text-success">
                Billed annually (${plan.yearly_price * 12}/year)
              </div>
            </div>

            <ul class="space-y-3 mb-6">
              <li :for={feature <- plan.features} class="flex items-center gap-2">
                <.icon name="hero-check" class="size-5 text-success flex-shrink-0" />
                <span class="text-sm">{feature}</span>
              </li>
              <li
                :for={feature <- plan.not_included}
                class="flex items-center gap-2 text-base-content/40"
              >
                <.icon name="hero-x-mark" class="size-5 flex-shrink-0" />
                <span class="text-sm">{feature}</span>
              </li>
            </ul>

            <.button
              variant={if plan.featured, do: "primary", else: nil}
              class={["w-full", plan.featured && "d-btn-lg"]}
            >
              {plan.cta}
            </.button>
          </div>
        </div>
      </div>

      <%!-- Feature Comparison Table --%>
      <div class="mb-16">
        <h2 class="text-2xl font-bold text-center mb-8">Compare plans</h2>
        <div class="overflow-x-auto">
          <table class="d-table">
            <thead>
              <tr>
                <th>Feature</th>
                <th class="text-center">Starter</th>
                <th class="text-center bg-primary/5">Pro</th>
                <th class="text-center">Enterprise</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Users</td>
                <td class="text-center">Up to 5</td>
                <td class="text-center bg-primary/5">Up to 20</td>
                <td class="text-center">Unlimited</td>
              </tr>
              <tr>
                <td>Storage</td>
                <td class="text-center">10 GB</td>
                <td class="text-center bg-primary/5">100 GB</td>
                <td class="text-center">Unlimited</td>
              </tr>
              <tr>
                <td>API Requests</td>
                <td class="text-center">10K/month</td>
                <td class="text-center bg-primary/5">100K/month</td>
                <td class="text-center">Unlimited</td>
              </tr>
              <tr>
                <td>Support</td>
                <td class="text-center">Email</td>
                <td class="text-center bg-primary/5">Priority Email</td>
                <td class="text-center">24/7 Phone & Email</td>
              </tr>
              <tr>
                <td>SSO</td>
                <td class="text-center">
                  <.icon name="hero-x-mark" class="size-5 text-base-content/30 mx-auto" />
                </td>
                <td class="text-center bg-primary/5">
                  <.icon name="hero-check" class="size-5 text-success mx-auto" />
                </td>
                <td class="text-center">
                  <.icon name="hero-check" class="size-5 text-success mx-auto" />
                </td>
              </tr>
              <tr>
                <td>Custom Integrations</td>
                <td class="text-center">
                  <.icon name="hero-x-mark" class="size-5 text-base-content/30 mx-auto" />
                </td>
                <td class="text-center bg-primary/5">
                  <.icon name="hero-x-mark" class="size-5 text-base-content/30 mx-auto" />
                </td>
                <td class="text-center">
                  <.icon name="hero-check" class="size-5 text-success mx-auto" />
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <%!-- FAQ Section --%>
      <div class="mb-16">
        <h2 class="text-2xl font-bold text-center mb-8">Frequently asked questions</h2>
        <div class="max-w-2xl mx-auto space-y-4">
          <div :for={faq <- @faqs} class="d-collapse d-collapse-arrow bg-base-100 border border-base-300">
            <input type="radio" name="faq-accordion" />
            <div class="d-collapse-title font-semibold">{faq.question}</div>
            <div class="d-collapse-content text-base-content/70">
              <p>{faq.answer}</p>
            </div>
          </div>
        </div>
      </div>

      <%!-- CTA Section --%>
      <div class="text-center py-12 bg-base-200 d-rounded-box">
        <h2 class="text-2xl font-bold mb-4">Still have questions?</h2>
        <p class="text-base-content/70 mb-6">
          Our team is here to help. Reach out and we'll get back to you within 24 hours.
        </p>
        <.button variant="primary">Contact Sales</.button>
      </div>
    </Layouts.app>
    """
  end

  defp sample_plans do
    [
      %{
        name: "Starter",
        description: "Perfect for small teams just getting started.",
        monthly_price: 29,
        yearly_price: 23,
        featured: false,
        cta: "Start Free Trial",
        features: [
          "Up to 5 team members",
          "10 GB storage",
          "10K API requests/month",
          "Email support",
          "Basic analytics"
        ],
        not_included: [
          "SSO authentication",
          "Custom integrations"
        ]
      },
      %{
        name: "Pro",
        description: "For growing teams that need more power.",
        monthly_price: 79,
        yearly_price: 63,
        featured: true,
        cta: "Start Free Trial",
        features: [
          "Up to 20 team members",
          "100 GB storage",
          "100K API requests/month",
          "Priority email support",
          "Advanced analytics",
          "SSO authentication"
        ],
        not_included: [
          "Custom integrations"
        ]
      },
      %{
        name: "Enterprise",
        description: "For large organizations with custom needs.",
        monthly_price: 199,
        yearly_price: 159,
        featured: false,
        cta: "Contact Sales",
        features: [
          "Unlimited team members",
          "Unlimited storage",
          "Unlimited API requests",
          "24/7 phone & email support",
          "Custom analytics",
          "SSO authentication",
          "Custom integrations"
        ],
        not_included: []
      }
    ]
  end

  defp sample_faqs do
    [
      %{
        question: "Can I change my plan later?",
        answer:
          "Yes, you can upgrade or downgrade your plan at any time. Changes will be reflected in your next billing cycle. If you upgrade, you'll be charged the prorated difference immediately."
      },
      %{
        question: "What payment methods do you accept?",
        answer:
          "We accept all major credit cards (Visa, MasterCard, American Express) as well as PayPal. For Enterprise plans, we also offer invoicing and bank transfers."
      },
      %{
        question: "Is there a free trial?",
        answer:
          "Yes! All plans come with a 14-day free trial. No credit card required to start. You'll have full access to all features during the trial period."
      },
      %{
        question: "What happens when my trial ends?",
        answer:
          "When your trial ends, you'll be prompted to choose a plan. If you don't select a plan, your account will be downgraded to our free tier with limited features."
      },
      %{
        question: "Can I get a refund?",
        answer:
          "We offer a 30-day money-back guarantee on all plans. If you're not satisfied, contact our support team within 30 days of your purchase for a full refund."
      }
    ]
  end
end
