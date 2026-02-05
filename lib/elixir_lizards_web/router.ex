defmodule ElixirLizardsWeb.Router do
  use ElixirLizardsWeb, :router

  use AshAuthentication.Phoenix.Router

  import AshAuthentication.Plug.Helpers

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ElixirLizardsWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :load_from_session
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :load_from_bearer
    plug :set_actor, :user
  end

  # Health check endpoint - no SSL redirect, no auth
  scope "/health", ElixirLizardsWeb do
    get "/", HealthController, :index
  end

  scope "/", ElixirLizardsWeb do
    pipe_through :browser

    ash_authentication_live_session :authenticated_routes do
      # in each liveview, add one of the following at the top of the module:
      #
      # If an authenticated user must be present:
      # on_mount {ElixirLizardsWeb.LiveUserAuth, :live_user_required}
      #
      # If an authenticated user *may* be present:
      # on_mount {ElixirLizardsWeb.LiveUserAuth, :live_user_optional}
      #
      # If an authenticated user must *not* be present:
      # on_mount {ElixirLizardsWeb.LiveUserAuth, :live_no_user}
    end
  end

  scope "/", ElixirLizardsWeb do
    pipe_through :browser

    get "/", PageController, :home

    # Demo pages showcasing DaisyUI components
    live "/demo", Showcase.DaisyUI.Pages.DemoIndexLive
    live "/demo/dashboard", Showcase.DaisyUI.Pages.DashboardLive
    live "/demo/features", Showcase.DaisyUI.Pages.FeaturesLive
    live "/demo/pricing", Showcase.DaisyUI.Pages.PricingLive
    live "/demo/team", Showcase.DaisyUI.Pages.TeamLive
    live "/demo/contact", Showcase.DaisyUI.Pages.ContactLive
    live "/demo/mapbox", Showcase.DaisyUI.Pages.MapboxLive

    auth_routes AuthController, ElixirLizards.Accounts.User, path: "/auth"
    sign_out_route AuthController

    # Remove these if you'd like to use your own authentication views
    sign_in_route register_path: "/register",
                  reset_path: "/reset",
                  auth_routes_prefix: "/auth",
                  on_mount: [{ElixirLizardsWeb.LiveUserAuth, :live_no_user}],
                  overrides: [
                    ElixirLizardsWeb.AuthOverrides,
                    Elixir.AshAuthentication.Phoenix.Overrides.DaisyUI
                  ]

    # Remove this if you do not want to use the reset password feature
    reset_route auth_routes_prefix: "/auth",
                overrides: [
                  ElixirLizardsWeb.AuthOverrides,
                  Elixir.AshAuthentication.Phoenix.Overrides.DaisyUI
                ]

    # Remove this if you do not use the confirmation strategy
    confirm_route ElixirLizards.Accounts.User, :confirm_new_user,
      auth_routes_prefix: "/auth",
      overrides: [
        ElixirLizardsWeb.AuthOverrides,
        Elixir.AshAuthentication.Phoenix.Overrides.DaisyUI
      ]

    # Remove this if you do not use the magic link strategy.
    magic_sign_in_route(ElixirLizards.Accounts.User, :magic_link,
      auth_routes_prefix: "/auth",
      overrides: [
        ElixirLizardsWeb.AuthOverrides,
        Elixir.AshAuthentication.Phoenix.Overrides.DaisyUI
      ]
    )
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirLizardsWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:elixir_lizards, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ElixirLizardsWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview

      # Component library index
      live "/components", ElixirLizardsWeb.Showcase.ComponentIndexLive

      # DaisyUI component demos
      live "/components/daisyui", ElixirLizardsWeb.Showcase.DaisyUI.ComponentDemoLive
      live "/components/daisyui/modal", ElixirLizardsWeb.Showcase.DaisyUI.Components.ModalDemo
      live "/components/daisyui/card", ElixirLizardsWeb.Showcase.DaisyUI.Components.CardDemo
      live "/components/daisyui/badge", ElixirLizardsWeb.Showcase.DaisyUI.Components.BadgeDemo

      live "/components/daisyui/dropdown",
           ElixirLizardsWeb.Showcase.DaisyUI.Components.DropdownDemo

      live "/components/daisyui/avatar", ElixirLizardsWeb.Showcase.DaisyUI.Components.AvatarDemo
      live "/components/daisyui/stat", ElixirLizardsWeb.Showcase.DaisyUI.Components.StatDemo

      live "/components/daisyui/empty-state",
           ElixirLizardsWeb.Showcase.DaisyUI.Components.EmptyStateDemo

      live "/components/daisyui/tabs", ElixirLizardsWeb.Showcase.DaisyUI.Components.TabsDemo

      live "/components/daisyui/breadcrumb",
           ElixirLizardsWeb.Showcase.DaisyUI.Components.BreadcrumbDemo

      live "/components/daisyui/tooltip", ElixirLizardsWeb.Showcase.DaisyUI.Components.TooltipDemo

      # Mishka Chelekom component demos
      live "/components/chelekom", ElixirLizardsWeb.Showcase.Chelekom.ComponentDemoLive
    end
  end

  if Application.compile_env(:elixir_lizards, :dev_routes) do
    import AshAdmin.Router

    scope "/admin" do
      pipe_through :browser

      ash_admin "/"
    end
  end
end
