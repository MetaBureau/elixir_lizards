defmodule ElixirLizards.ChelekomCollapsibleMarkupTest do
  use ExUnit.Case, async: true

  @collapse_path Path.expand(
                   "../../lib/elixir_lizards_web/components/chelekom/collapse.ex",
                   __DIR__
                 )
  @accordion_path Path.expand(
                    "../../lib/elixir_lizards_web/components/chelekom/accordion.ex",
                    __DIR__
                  )

  test "collapse root ignores patches and clips content by default" do
    source = File.read!(@collapse_path)

    assert source =~ ~S(phx-hook="Collapsible")
    assert source =~ ~S(phx-update="ignore")
    assert source =~ ~S(class="collapse-panel overflow-hidden")
    assert source =~ ~S(class="transition-[max-height] max-h-0 overflow-hidden")
  end

  test "accordion assigns deterministic ids and clips content by default" do
    source = File.read!(@accordion_path)

    assert source =~ ~S(phx-hook="Collapsible")
    assert source =~ ~S(phx-update="ignore")
    assert source =~ ~S/Map.put(item, :id, "#{assigns.id}-item-#{index}")/
    assert source =~ ~S/data-collapsible-trigger={item.id}/
    assert source =~ ~S/data-collapsible-panel={item.id}/

    assert source =~
             ~S/["transition-[max-height] max-h-0 overflow-hidden", "duration-#{@duration}"]/

    assert source =~ ~S/|> Enum.map(& &1[:id])/
  end
end
