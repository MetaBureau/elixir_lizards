defmodule ElixirLizards.MishkaComponentsRegistryTest do
  use ExUnit.Case, async: true

  @registry_path Path.expand("../../assets/vendor/mishka_components.js", __DIR__)
  @component_glob Path.expand("../../lib/elixir_lizards_web/components/chelekom/*.ex", __DIR__)

  test "registers every chelekom phx-hook in the vendor hook bundle" do
    registry = File.read!(@registry_path)

    declared_hooks =
      @component_glob
      |> Path.wildcard()
      |> Enum.flat_map(fn path ->
        path
        |> File.read!()
        |> then(&Regex.scan(~r/phx-hook="([^"]+)"/, &1, capture: :all_but_first))
        |> List.flatten()
      end)
      |> Enum.uniq()
      |> Enum.sort()

    registered_hooks =
      Regex.scan(~r/^\s{2}([A-Z][A-Za-z0-9_]*)[,]?$/m, registry, capture: :all_but_first)
      |> List.flatten()
      |> Enum.uniq()
      |> Enum.sort()

    assert declared_hooks == registered_hooks
  end
end
