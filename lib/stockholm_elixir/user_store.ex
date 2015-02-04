defmodule StockholmElixir.UserStore do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, [name: :user_store])
  end

  def handle_call(:get, _from, list) do
    {:reply, list, list}
  end

  def handle_cast({:push, h}, t) do
    {:noreply, [h|t]}
  end
end
