defmodule Erlangjobs.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :description, :text
      add :registration_link, :string
      add :contact_email, :string
      add :contact_phone, :string
      add :is_approved, :boolean, default: false

      timestamps()
    end

  end
end
