defmodule Xadara.Epoch do
  @moduledoc """
  Returns the current epoch time in an integer format.
  """
  def epoch do
    epoch_url = Application.get_env(:xadara, :epoch_url)
    %{body: body} = Xadara.Base.get!(epoch_url)
    body
  end
end
