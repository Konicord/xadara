defmodule Xadara.Disposable do
  @moduledoc """
  Check if an email is disposable, to avoid fake/temp accounts.
  """

  @doc """
  ## Examples
    iex> Xadara.Disposable.disposable("email@yopmail.com")
        %{"disposable" => true}
    iex> Xadara.Disposable.disposable("email@gmail.com")
        %{"disposable" => false}
  """

  @type email_type() :: String.t()
  @spec disposable(email_type()) :: String.t() | boolean()
  def disposable(email) when is_binary(email) do
    kb_url = Application.get_env(:xadara, :kb_url)

    case Xadara.Base.get!("#{kb_url}#{URI.encode_www_form(email)}") do
      %HTTPoison.Response{body: body, status_code: 200} ->
        Poison.decode!(body)

      %HTTPoison.Response{status_code: status_code} when status_code > 399 ->
        IO.inspect(status_code, label: "STATUS_CODE")
        :error

      _response ->
        # Xadara.Error
        raise "Couldnt reach APi 400"
    end
  end
end
