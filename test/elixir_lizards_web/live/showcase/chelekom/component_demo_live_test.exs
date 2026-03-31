defmodule ElixirLizardsWeb.Showcase.Chelekom.ComponentDemoLiveTest do
  use ElixirLizardsWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  alias ElixirLizardsWeb.Showcase.Chelekom.ComponentDemoLive

  test "renders the chelekom showcase with the installed component count", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/showcase/chelekom")

    assert has_element?(view, "#chelekom-showcase")

    assert has_element?(
             view,
             "#chelekom-component-count",
             "#{ComponentDemoLive.component_count()} Components Installed"
           )

    assert has_element?(view, "#category-general")
    assert has_element?(view, "#category-navigation")
    assert has_element?(view, "#category-feedback")
    assert has_element?(view, "#category-overlays")
    assert has_element?(view, "#category-media")
    assert has_element?(view, "#category-forms")
  end

  test "filters the chelekom showcase by category", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/showcase/chelekom")

    assert has_element?(view, "#chelekom-category-filter")

    view
    |> element("#chelekom-filter-forms")
    |> render_click()

    assert has_element?(view, "#category-forms")
    refute has_element?(view, "#category-general")
    refute has_element?(view, "#category-navigation")

    view
    |> element("#chelekom-filter-all")
    |> render_click()

    assert has_element?(view, "#category-general")
    assert has_element?(view, "#category-navigation")
    assert has_element?(view, "#category-forms")
  end
end
