defmodule Erlangjobs.Repo.Migrations.AddSlugToJobs do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :slug, :string
    end
  end
end
