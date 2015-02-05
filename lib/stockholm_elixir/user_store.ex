defmodule StockholmElixir.UserStore do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, [name: :user_store])
  end

  def handle_call(:all, _from, set) do
    {:reply, set, set}
  end

  def handle_cast({:put, element}, set) do
    {:noreply, Enum.into(element, set)}
  end
end
