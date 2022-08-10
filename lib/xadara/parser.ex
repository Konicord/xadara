defmodule Xadara.Parser do
  @doc """
  Utility types for functions.
  Due to Routing problems, they got moved directly to the function.
  Usage:
  @behaviour Xadara.Parser
  @impl Xadara.Parser
  def function_here ...
  """
  # @callback parse(String.t()) :: {:ok, term} | {:error, String.t()}
  # @callback getIP() :: {:ok, String.t()} | {:error, :api_down}
  # @callback getLocation() :: {:ok, String.t()} | {:error, :api_ratelimited}
  @callback randomName() :: String.t()
end
