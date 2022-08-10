defmodule XadaraWeb.EpochController do
  use XadaraWeb, :controller

  import Xadara.Epoch

  def index(conn, _params) do
    send_resp(conn, 200, epoch())
  end
end
