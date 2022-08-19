defmodule XadaraWeb.QRCodeController do
  use XadaraWeb, :controller

  import Xadara.QR

  def index(conn, %{"url" => url}) do
    send_resp(conn, 200, generate_qr(url))
  end
end
