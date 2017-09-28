defmodule Erlangjobs.Repo.Migrations.AddFieldsToJobs do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :currency_type, :integer, default: 0
      add :employment_type, :integer, default: 0
      add :expire_at, :naive_datetime, null: false
    end
  end
end
