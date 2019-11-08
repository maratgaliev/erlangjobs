defmodule Erlangjobs.Repo.Migrations.CreateResources do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :title, :string
      add :url, :string
      add :description, :text
    
      timestamps()
    end
    
  end
end
