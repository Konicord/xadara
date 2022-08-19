defmodule XadaraWeb.GeoController do
  use XadaraWeb, :controller

  import Xadara.Geo

  def index(conn, %{"ip" => ip}) do
    send_resp(conn, 200, geo_data(ip))
  end
end
