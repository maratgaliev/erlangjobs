defmodule Erlangjobs.Migration do
  def migrate do
    {:ok, _} = Application.ensure_all_started(:erlangjobs)

    path = Application.app_dir(:erlangjobs, "priv/repo/migrations")

    Ecto.Migrator.run(Erlangjobs.Repo, path, :up, all: true)
  end
end