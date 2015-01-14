# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the router
config :stockholm_elixir, StockholmElixir.Endpoint,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT")],
  secret_key_base: "oT6D9Q7cMfv3xEFhd/2R0op1TpsXWPGdjrm5BXcwYBomdzUSniMZsV3J0R5xYGMPnxhO8hEDesW7wHtAp01u5w==",
  debug_errors: false,
  error_controller: StockholmElixir.PageController

# Session configuration
config :phoenix, StockholmElixir.Router,
  session: [store: :cookie,
            key: "_stockholm_elixir_key"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
