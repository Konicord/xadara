defmodule Xadara.Random do
  # def txt do
  #   File.stream!("lib/data/names.txt")
  #   |> Enum.random()
  #   |> String.trim()
  # end

  @behaviour Xadara.Parser

  @doc """
  Generates a random name from a JSON formatted file.
  Ends up in the same result, main difference is library vs native
  """
  @impl Xadara.Parser
  def randomName do
    File.read!("lib/xadara/data/names.json")
    |> Poison.decode!()
    |> Enum.random()
  end
end
