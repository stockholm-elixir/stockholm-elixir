defmodule StockholmElixir.Crypto do
  def md5(string) do
    :crypto.hash(:md5, string)
    |> :erlang.bitstring_to_list
    |> Enum.map(fn(x) -> :erlang.integer_to_binary(x, 16) end)
    |> :erlang.list_to_binary
  end
end
