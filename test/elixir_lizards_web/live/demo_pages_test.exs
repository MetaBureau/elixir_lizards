defmodule ElixirLizardsWeb.DemoPagesTest do
  use ElixirLizardsWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "GET /demo renders the demo index", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/demo")

    assert render(view) =~ "Demo Pages"
    assert render(view) =~ "Dashboard"
    assert render(view) =~ "Features"
  end

  test "GET /demo/dashboard renders the dashboard demo", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/demo/dashboard")

    assert render(view) =~ "Recent Projects"
    assert render(view) =~ "Quick Actions"
  end

  test "GET /demo/features renders the features demo", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/demo/features")

    assert render(view) =~ "Build Amazing Apps"
    assert render(view) =~ "Loved by developers"
  end

  test "GET /demo/pricing renders the pricing demo", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/demo/pricing")

    assert render(view) =~ "Simple, transparent pricing"
    assert render(view) =~ "Compare plans"
  end

  test "GET /demo/team renders the team demo", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/demo/team")

    assert render(view) =~ "Meet the people behind Elixir Lizards"
    assert render(view) =~ "Leadership"
  end

  test "GET /demo/contact renders the contact demo form", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/demo/contact")

    assert has_element?(view, "#contact-form")
  end

  test "GET /demo/mapbox renders the mapbox demo shell", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/demo/mapbox")

    html = render(view)

    assert html =~ "Mapbox Integration"
    assert html =~ "Locations"
    assert html =~ "Mapbox Token Required" or html =~ ~s(id="mapbox-container")
  end
end
