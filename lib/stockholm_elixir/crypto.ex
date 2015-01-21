defmodule StockholmElixir.Crypto do
  def md5(string) do
    :erlang.list_to_binary(Enum.map(:erlang.bitstring_to_list(:crypto.md5(string)), fn(x) -> :erlang.integer_to_binary(x, 16) end))
  end
end
