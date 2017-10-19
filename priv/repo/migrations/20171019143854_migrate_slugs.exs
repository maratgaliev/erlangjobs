defmodule Erlangjobs.Repo.Migrations.MigrateSlugs do
  use Ecto.Migration
  alias Erlangjobs.Repo
  alias Erlangjobs.Offers.Job
  
  def change do
	jobs = Repo.all(Job)

	for job <- jobs do
	  updated_at = DateTime.utc_now() |> DateTime.to_naive()
	  job
	  |> Job.changeset(%{updated_at: updated_at, title: job.title})
	  |> Repo.update
	end
  end
end
