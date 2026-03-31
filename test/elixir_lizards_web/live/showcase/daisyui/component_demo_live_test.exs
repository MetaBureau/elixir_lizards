defmodule ElixirLizardsWeb.Showcase.DaisyUI.ComponentDemoLiveTest do
  use ElixirLizardsWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias ElixirLizardsWeb.Showcase.DaisyUI.ComponentDemoLive

  test "renders the daisyui showcase with stable component cards", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/showcase/daisyui")

    assert has_element?(view, "#daisyui-showcase")

    assert has_element?(
             view,
             "#daisyui-component-count",
             "#{ComponentDemoLive.component_count()} Components in the DaisyUI showcase catalog"
           )

    for component <- ComponentDemoLive.components() do
      assert has_element?(view, "##{component_dom_id(component.name)}")
    end
  end

  defp component_dom_id(name) do
    "daisyui-component-" <>
      (name
       |> String.downcase()
       |> String.replace(~r/[^a-z0-9]+/u, "-")
       |> String.trim("-"))
  end
end
