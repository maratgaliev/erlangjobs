defmodule Erlangjobs.Repo.Migrations.AddSlugToJobs do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :slug, :string
    end

    create index(:jobs, [:slug], unique: true)
  end
end
