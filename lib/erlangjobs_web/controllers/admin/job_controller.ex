defmodule ErlangjobsWeb.Admin.JobController do
  use ErlangjobsWeb, :controller

  plug :put_layout, "admin.html"

  alias Erlangjobs.Offers
  alias Erlangjobs.Offers.Job
  alias Erlangjobs.Twitter
  alias Erlangjobs.Telegram

  def index(conn, params) do
    jobs = Offers.list_admin_jobs(params)
    render(conn, "index.html", jobs: jobs)
  end

  def new(conn, params) do
    changeset = Job.changeset(%Job{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"job" => job_params}) do
    changeset = Job.changeset(%Job{}, job_params)

    case Repo.insert(changeset) do
      {:ok, job} ->
        conn
        |> put_flash(:info, "Job created successfully.")
        |> redirect(to: job_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    job = Repo.get!(Job, id)
    render(conn, "show.html", job: job)
  end

  def edit(conn, %{"id" => id}) do
    job = Repo.get!(Job, id)
    changeset = Job.changeset(job)
    render(conn, "edit.html", job: job, changeset: changeset)
  end

  def update(conn, %{"id" => id, "job" => job_params}) do
    job = Repo.get!(Job, id)
    changeset = Job.changeset(job, job_params)

    case Repo.update(changeset) do
      {:ok, job} ->
        conn
        |> put_flash(:info, "Job updated successfully.")
        |> posting_in_social_networks(job, changeset)
        |> redirect(to: job_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", job: job, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    job = Repo.get!(Job, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(job)

    conn
    |> put_flash(:info, "Job deleted successfully.")
    |> redirect(to: job_path(conn, :index))
  end

  defp posting_in_social_networks(conn, job, changeset) do
    is_approved = Ecto.Changeset.get_change(changeset, :is_approved, :false)
    if is_approved do
      url = ErlangjobsWeb.Router.Helpers.job_url(conn, :show, job)
      spawn(Twitter, :tweet_job, [job, url])
      spawn(Telegram, :post_offer, [job, url])
    end
    conn
  end
end
