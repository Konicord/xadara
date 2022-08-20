defmodule XadaraWeb.MainController do
  use XadaraWeb, :controller

  def index(conn, _params) do
    path = "https://github.com/vKxni/xadara-api"
    conn |> redirect(external: path) |> halt()
  end
end
