defmodule StockholmElixir.Channels.Chat do
  use Phoenix.Channel

  def join("rooms:lobby", message, socket) do
    if verify_user_token(message) do
      reply socket, "joined", %{status: "connected"}
      broadcast socket, "user:entered", %{username: message["username"]}
      {:ok, socket}
    else
      reply socket, "new:msg", %{username: "This website", content: "unauthorized"}
      {:error, socket, :unauthorized}
    end
  end

  def handle_in("new:msg", message, socket) do
    if verify_user_token(message) do
      broadcast socket, "new:msg", message
      {:ok, socket}
    else
      reply socket, "new:msg", %{username: "This website", content: "unauthorized"}
      {:error, socket, :unauthorized}
    end
  end

  defp verify_user_token(message) do
    username = message["username"]
    user_token = message["user_token"]
    signing_key = System.get_env("SIGNING_KEY")
    expected_digest = :erlang.list_to_binary(Enum.map(:erlang.bitstring_to_list(:crypto.md5("#{username}:#{signing_key}")), fn(x) -> :erlang.integer_to_binary(x, 16) end))
    user_token == expected_digest
  end
end
