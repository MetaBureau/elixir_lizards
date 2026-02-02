defmodule ElixirLizards.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirLizardsWeb.Telemetry,
      ElixirLizards.Repo,
      {DNSCluster, query: Application.get_env(:elixir_lizards, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixirLizards.PubSub},
      # Start a worker by calling: ElixirLizards.Worker.start_link(arg)
      # {ElixirLizards.Worker, arg},
      # Start to serve requests, typically the last entry
      ElixirLizardsWeb.Endpoint,
      {AshAuthentication.Supervisor, [otp_app: :elixir_lizards]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirLizards.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirLizardsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
