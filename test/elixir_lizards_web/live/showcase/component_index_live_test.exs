defmodule ElixirLizardsWeb.Showcase.ComponentIndexLiveTest do
  use ElixirLizardsWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias ElixirLizardsWeb.Showcase.{Chelekom, DaisyUI}

  test "renders dynamic library counts on the showcase index", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/showcase")

    assert has_element?(view, "#showcase-library-index")
    assert has_element?(view, "#showcase-library-daisyui")
    assert has_element?(view, "#showcase-library-chelekom")

    assert has_element?(
             view,
             "#showcase-daisyui-count",
             "#{DaisyUI.ComponentDemoLive.component_count()} Components"
           )

    assert has_element?(
             view,
             "#showcase-chelekom-count",
             "#{Chelekom.ComponentDemoLive.component_count()} Components"
           )

    assert has_element?(
             view,
             "#showcase-comparison-daisyui-count",
             "#{DaisyUI.ComponentDemoLive.component_count()} components"
           )

    assert has_element?(
             view,
             "#showcase-comparison-chelekom-count",
             "#{Chelekom.ComponentDemoLive.component_count()} components"
           )
  end
end
