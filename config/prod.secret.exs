use Mix.Config

config :erlangjobs, Erlangjobs.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY")

config :erlangjobs, Erlangjobs.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DB_USER"),
  password: System.get_env("DB_PASSWORD"),
  database: System.get_env("DB_NAME"),
  pool_size: 20