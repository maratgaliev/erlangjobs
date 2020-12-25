defmodule Erlangjobs.Repo.Migrations.AddJobLinkToJobs do
  use Ecto.Migration

  def change do
    alter table(:jobs) do
      add :job_link, :string
    end
  end
end
