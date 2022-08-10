defmodule Xadara.QR do
  @moduledoc """
  Generates an QR code based on a URL given by the user
  """

  @doc """
  ## Examples
    iex> Xadara.QR.generate_qr("https://website.com") | http://localhost:4000/qr/website.com
  """

  @type url_link() :: String.t()
  @spec generate_qr(url_link()) :: String.t() | :invalid_link
  def generate_qr(url) when is_binary(url) do
    qr_url = Application.get_env(:xadara, :qr_url)

    case Xadara.Base.get!("#{qr_url}#{URI.encode_www_form(url)}") do
      %HTTPoison.Response{body: body, status_code: 200} ->
        body

      %HTTPoison.Response{status_code: status_code} when status_code > 399 ->
        IO.inspect(status_code, label: "STATUS_CODE")
        :error

      _response ->
        raise Xadara.Error
    end
  end
end
