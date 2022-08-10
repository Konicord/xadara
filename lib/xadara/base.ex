defmodule Xadara.Base do
  use HTTPoison.Base

  @moduledoc """
  This handles HTTP requests without api key (basic requests).
  If APi key is required, use Xadara.ApiBase
  """

  def process_request_headers(headers) do
    [{"Content-Type", "application/json"} | headers]
  end
end
