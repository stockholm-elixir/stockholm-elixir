defmodule StockholmElixir.Endpoint do
  use Phoenix.Endpoint, otp_app: :stockholm_elixir

  plug Plug.Static,
    at: "/", from: :stockholm_elixir

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_stockholm_elixir_key",
    signing_salt: "9HUmdyG3",
    encryption_salt: "4L8wmQTR"

  plug :router, StockholmElixir.Router
end
