defmodule XadaraWeb.MainController do
  use XadaraWeb, :controller

  def index(conn, _params) do
    # TODO: create docs with astro
    path = "https://github.com"
    conn |> redirect(external: path) |> halt()
  end
end
