defmodule ErlangjobsWeb.JobController do
  use ErlangjobsWeb, :controller

  alias Erlangjobs.Offers
  alias Erlangjobs.Offers.Job

  def index(conn, params) do
    page = Offers.list_jobs(params)
    render(conn, "index.html", jobs: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = Offers.change_job(%Job{})
    render(conn, "new.html", changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    job = Offers.get_job!(id)
    render(conn, "show.html", job: job)
  end

  def edit(conn, %{"id" => id}) do
    job = Offers.get_job!(id)
    changeset = Offers.change_job(job)
    render(conn, "edit.html", job: job, changeset: changeset)
  end

  def create(conn, %{"job" => job_params}) do
    case Offers.create_job(job_params) do
      {:ok, _job} ->
        conn
        |> put_flash(:info, "Job created successfully.")
        |> redirect(to: job_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "job" => job_params}) do
    job = Offers.get_job!(id)

    case Offers.update_job(job, job_params) do
      {:ok, job} ->
        conn
        |> put_flash(:info, "Job updated successfully.")
        |> redirect(to: job_path(conn, :show, job))
      {:error, changeset} ->
        render(conn, "edit.html", job: job, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    job = Offers.get_job!(id)

    with {:ok, %Job{}} <- Offers.delete_job(job) do
      conn
      |> put_flash(:info, "Job deleted successfully.")
      |> redirect(to: job_path(conn, :index))
    end
  end

  def feed(conn, _params) do
    jobs = Offers.list_jobs()
    conn
     |> put_layout(:none)
     |> put_resp_content_type("application/xml")
     |> render "feed.xml", jobs: jobs
  end
end
