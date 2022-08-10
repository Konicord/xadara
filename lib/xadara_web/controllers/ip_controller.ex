defmodule XadaraWeb.IPController do
  use XadaraWeb, :controller

  import Xadara.IP

  def index(conn, _params) do
    send_resp(conn, 200, getIP())
  end
end
