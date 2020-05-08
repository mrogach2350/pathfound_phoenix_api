# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pathfound_phoenix_api,
  ecto_repos: [PathfoundPhoenixApi.Repo]

# Configures the endpoint
config :pathfound_phoenix_api, PathfoundPhoenixApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ov/APUVmQRi8CTwiSyiR2Hl1FlCV6hCSma1evot51EgYmCnuqHZYntS0bQ4ZuctY",
  render_errors: [view: PathfoundPhoenixApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PathfoundPhoenixApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
