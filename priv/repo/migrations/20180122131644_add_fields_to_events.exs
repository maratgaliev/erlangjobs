defmodule Erlangjobs.Repo.Migrations.AddCity do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :city, :string
      add :address, :string
      add :start_date, :naive_datetime
    end
  end
end
