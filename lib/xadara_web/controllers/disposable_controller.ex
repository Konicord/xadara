defmodule XadaraWeb.DisposableController do
  use XadaraWeb, :controller

  import Xadara.Disposable

  def index(conn, email, _params) do
    send_resp(conn, 200, disposable(email))
  end
end
