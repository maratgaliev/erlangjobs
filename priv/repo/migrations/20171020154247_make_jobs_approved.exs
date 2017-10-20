defmodule Erlangjobs.Repo.Migrations.MakeJobsApproved do
  use Ecto.Migration
  alias Erlangjobs.Repo
  alias Erlangjobs.Offers.Job
  
  def change do
	Repo.update_all(Job, set: [is_approved: true])
  end
end
