defmodule Xadara.Message do
  @moduledoc """
    Prepare JSON messages
  """

  @doc """
    Returns a common response JSON message
  """
  def common_response_msg(status_code, attribute, data \\ %{}) do
    %{status_code: status_code, attribute: attribute, data: data}
  end
end
