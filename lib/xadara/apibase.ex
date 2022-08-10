defmodule Xadara.ApiBase do
  use HTTPoison.Base

  @moduledoc """
  This handles HTTP requests that require APi token.
  `base.ex` is for those without
  """

  @token Application.get_env(:xadara, :geo_url)

  def process_request_headers(headers),
    do: headers ++ [Authorization: "Bearer #{@token}", Accept: "application/json"]
end
