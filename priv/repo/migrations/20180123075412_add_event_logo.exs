defmodule Erlangjobs.Repo.Migrations.AddEventLogo do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :logo, :string
    end
  end
end
