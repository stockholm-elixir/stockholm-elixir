defmodule StockholmElixirCryptoTest do
  use ExUnit.Case

  test "md5 returns D41D8CD98F0B24E980998ECF8427E for an empty string" do
    assert StockholmElixir.Crypto.md5("") ==  "D41D8CD98F0B24E980998ECF8427E"
  end

  test "md5 returns the md5 hex sum of another string" do
    assert StockholmElixir.Crypto.md5("foo") == "ACBD18DB4CC2F85CEDEF654FCCC4A4D8"
  end
end
