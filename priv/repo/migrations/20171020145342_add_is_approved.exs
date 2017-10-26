defmodule Erlangjobs.Repo.Migrations.AddIsApproved do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :is_approved, :boolean, default: false
    end
  end
end
