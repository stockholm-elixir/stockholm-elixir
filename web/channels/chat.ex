defmodule StockholmElixir.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", message, socket) do
    reply socket, "joined", %{status: "connected"}
    {:ok, socket}
  end
  # 'subtopics' can be easily matched using binary pattern matching
  def join("rooms:" <> _private_topic, message, socket) do
    {:error, socket, :unauthorized}
  end

  def handle_in("new:msg", message, socket) do
    broadcast socket, "new:msg", message
    {:ok, socket}
  end

  # optional, hook into outgoing new:msg for all sockets for customized per-socket reply
  def handle_out("new:msg", message, socket) do
    reply socket, "new:msg", Dict.merge(message,
      is_editable: User.can_edit_message?(socket.assigns[:user], message)
    )
    {:ok, socket}
  end
end
