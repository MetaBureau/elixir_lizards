defmodule ElixirLizards.Accounts do
  use Ash.Domain, otp_app: :elixir_lizards, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource ElixirLizards.Accounts.Token
    resource ElixirLizards.Accounts.User
  end
end
