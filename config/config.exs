# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :auth_api_demo,
  ecto_repos: [AuthApiDemo.Repo]

# Configures the endpoint
config :auth_api_demo, AuthApiDemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4kM30ZZCYy76L/fMoP5shalLs6wrMRcVoHkEr8m7M0MvDzPJpKepC+5RdlxfKMBN",
  render_errors: [view: AuthApiDemoWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: AuthApiDemo.PubSub,
  live_view: [signing_salt: "VyOskN7K"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :auth_api_demo, AuthApiDemo.Guardian,
  issuer: "auth_api_demo",
  secret_key: "JzxteEaULt/zMBP5N7OtMSq51i69yQ97KQuHU+ffPlHC4ViU86OniWBhKuyN4mE5"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
