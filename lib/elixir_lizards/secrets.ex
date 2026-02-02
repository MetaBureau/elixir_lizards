defmodule ElixirLizards.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        ElixirLizards.Accounts.User,
        _opts,
        _context
      ) do
    Application.fetch_env(:elixir_lizards, :token_signing_secret)
  end
end
