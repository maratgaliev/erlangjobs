# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :erlangjobs, ErlangjobsWeb.Gettext,
  locales: ~w(ru en),
  default_locale: "ru"

# General application configuration
config :erlangjobs,
  ecto_repos: [Erlangjobs.Repo]

# Configures the endpoint
config :erlangjobs, ErlangjobsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cNG/+4Ux4N7WF3IAlGhLYvaTU+YY6L8BVQRdA66pYwg7wC3eyTyGanmlAlC3Ww5X",
  render_errors: [view: ErlangjobsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Erlangjobs.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :scrivener_html,
  routes_helper: ErlangjobsWeb.Router.Helpers,
  view_style: :bootstrap_v4

config :extwitter, :oauth, [
   consumer_key: "_",
   consumer_secret: "_",
   access_token: "_",
   access_token_secret: "_"
]

config :erlangjobs, Erlangjobs.Twitter,
  client: ExTwitter

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
