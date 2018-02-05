use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :erlangjobs, :environment, :travis

config :erlangjobs, ErlangjobsWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :erlangjobs, Erlangjobs.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "erlangjobs_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :erlangjobs, Erlangjobs.Twitter,
  client: Erlangjobs.Twitter.StubClient

config :erlangjobs, Erlangjobs.Telegram,
  client: Erlangjobs.Telegram.StubClient

if File.exists?("config/test.local.exs") do
  import_config "test.local.exs"
end
