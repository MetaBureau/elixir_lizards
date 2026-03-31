defmodule ElixirLizards.Reference.BelongsToDomain do
  use Ash.Domain, validate_config_inclusion?: false

  resources do
    resource ElixirLizards.Reference.Parent
    resource ElixirLizards.Reference.Child
  end
end
