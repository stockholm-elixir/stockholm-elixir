defmodule StockholmElixir.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  scope "/", StockholmElixir do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end
end
