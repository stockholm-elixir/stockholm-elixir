use Mix.Config

config :stockholm_elixir, StockholmElixir.Endpoint,
  http: [port: System.get_env("PORT") || 4001],
  catch_errors: false

# Print only warnings and errors during test
config :logger, level: :warn
