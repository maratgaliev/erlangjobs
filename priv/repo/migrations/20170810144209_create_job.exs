defmodule Erlangjobs.Repo.Migrations.CreateJob do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :title, :string
      add :description, :text
      add :city, :string
      add :is_remote, :boolean, default: false, null: false
      add :salary, :decimal
      add :email, :string
      add :company, :string
      add :site, :string
      add :phone, :string
      add :contact_name, :string

      timestamps()
    end

  end
end
