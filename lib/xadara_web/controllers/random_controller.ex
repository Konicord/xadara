defmodule XadaraWeb.RandomController do
  use XadaraWeb, :controller

  import Xadara.Random

  def index(conn, _params) do
    send_resp(conn, 200, randomName())
  end
end
