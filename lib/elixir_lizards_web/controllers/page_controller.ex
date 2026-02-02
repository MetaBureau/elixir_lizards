defmodule ElixirLizardsWeb.PageController do
  use ElixirLizardsWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
