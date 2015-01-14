defmodule StockholmElixir.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :assign_current_user
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  pipeline :auth do
    plug :put_oauth_strategy
  end

  scope "/", StockholmElixir do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth", alias: StockholmElixir do
    pipe_through [:browser, :auth]
    get "/", AuthController, :index
    get "/callback", AuthController, :callback
  end

  # Fetch the current user from the session and add it to `conn.assigns`. This
  # will allow you to have access to the current user in your views with
  # `@current_user`.
  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end

  # Fetch the configured strategy from the router's config and store the
  # initialized strategy into `conn.private.oauth2_strategy`.
  defp put_oauth_strategy(conn, _) do
    {strategy, opts} = StockholmElixir.Endpoint.config(:oauth2)
    put_private(conn, :oauth2_strategy, apply(strategy, :new, [opts]))
  end

  # Other scopes may use custom stacks.
  # scope "/api" do
  #   pipe_through :api
  # end
end
