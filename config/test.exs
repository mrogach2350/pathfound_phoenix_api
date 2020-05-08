use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pathfound_phoenix_api, PathfoundPhoenixApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pathfound_phoenix_api, PathfoundPhoenixApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "pathfound_phoenix_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
