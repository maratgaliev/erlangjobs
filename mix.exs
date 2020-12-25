defmodule Erlangjobs.Mixfile do
  use Mix.Project

  def project do
    [app: :erlangjobs,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Erlangjobs, []},
     applications: [:captcha, :phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext, :phoenix_ecto, :postgrex,
                    :scrivener_ecto, :scrivener_html, :timex, :timex_ecto, :edeliver, :earmark, :oauther, :extwitter, :ex_machina,
                    :russian, :basic_auth, :nadia, :arc_ecto, :recaptcha, :hound]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.3.0"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.3.0"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:scrivener_ecto, "~> 1.2"},
     {:scrivener_html, "~> 1.7"},
     {:timex, "~> 3.1"},
     {:timex_ecto, "~> 3.1"},
     {:earmark, "~> 1.2.2"},
     {:edeliver, "~> 1.4.4"},
     {:distillery, "~> 1.5"},
     {:ecto_enum, "~> 1.0.2"},
     {:oauther, "~> 1.1"},
     {:extwitter, "~> 0.9"},
     {:russian, "~> 0.1.0"},
     {:hound, "~> 1.0"},
     {:ex_machina, "~> 2.1"},
     {:basic_auth, "~> 2.2"},
     {:nadia, "~> 0.4.3"},
     {:arc, "~> 0.8.0"},
     {:arc_ecto, "~> 0.7.0"},
     {:recaptcha, "~> 2.0"},
     {:captcha, "~> 0.1.0", git: "https://github.com/maratgaliev/elixir-captcha.git"}]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     test: ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
