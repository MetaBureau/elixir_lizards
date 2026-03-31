defmodule ElixirLizardsWeb.DevRoutesTest do
  use ElixirLizardsWeb.ConnCase, async: true

  test "GET /dev/dashboard redirects to the dashboard home", %{conn: conn} do
    conn = get(conn, ~p"/dev/dashboard")

    assert redirected_to(conn) == "/dev/dashboard/home"

    conn = get(recycle(conn), "/dev/dashboard/home")

    assert html_response(conn, 200) =~ "Phoenix LiveDashboard"
  end

  test "GET /admin renders the Ash admin UI", %{conn: conn} do
    conn = get(conn, "/admin")

    assert html_response(conn, 200) =~ "Ash Admin"
  end

  test "GET /dev/mailbox renders the swoosh mailbox preview", %{conn: conn} do
    conn = get(conn, "/dev/mailbox")

    assert html_response(conn, 200) =~ "Swoosh Mailbox Viewer"
  end
end
