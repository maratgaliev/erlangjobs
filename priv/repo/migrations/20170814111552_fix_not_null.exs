defmodule Erlangjobs.Repo.Migrations.FixNotNull do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      remove :expire_at
      add :expire_at, :utc_datetime
    end
  end
end
