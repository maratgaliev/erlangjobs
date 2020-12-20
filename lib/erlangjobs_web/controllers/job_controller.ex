defmodule ErlangjobsWeb.JobController do
  use ErlangjobsWeb, :controller

  alias Erlangjobs.Offers
  alias Erlangjobs.Offers.Job
  alias Erlangjobs.Telegram

  def index(conn, params) do
    page = Offers.list_jobs(params)
    render(conn, "index.html", jobs: page.entries, page: page)
  end

  def show(conn, %{"id" => id}) do
    try do
      job = Offers.get_job!(id)
      render(conn, "show.html", job: job, page_title: job.title)
    rescue
      Ecto.NoResultsError ->
        conn
        |> put_status(:not_found)
        |> put_view(ErlangjobsWeb.ErrorView)
        |> render("404.html")
    end
  end

  def edit(conn, %{"id" => id}) do
    job = Offers.get_job!(id)
    changeset = Offers.change_job(job)
    render(conn, "edit.html", job: job, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Offers.change_job(%Job{})
    
    case Captcha.get() do
      {:ok, text, img_binary } ->
        conn
        |> fetch_session
        |> put_session(:img_text, text)
        |> render("new.html", changeset: changeset, img: Base.encode64(img_binary), captcha_error: false)
    end

  end

  def create(conn, %{"job" => job_params} = params) do
    captcha_error = false
    {verification, _} = Recaptcha.verify(params["g-recaptcha-response"])
    captcha_text = get_session(conn, :img_text)
    request_captcha_text = Map.get(job_params, "img_text")
    if (verification == :ok) && (captcha_text == request_captcha_text) do
      case Offers.create_job(job_params) do
        {:ok, job} ->
          conn
          |> notify_admins(job)
          |> put_flash(:info, "Вакансия успешно создана, и будет добавлена на сайт после проверки")
          |> redirect(to: job_path(conn, :index))
        {:error, %Ecto.Changeset{} = changeset} ->
          case Captcha.get() do
            {:ok, text, img_binary } ->
              conn
              |> fetch_session
              |> put_session(:img_text, text)
              |> render("new.html", changeset: changeset, img: Base.encode64(img_binary), captcha_error: captcha_error)
          end
      end    
    else
      captcha_error = true
      changeset = Job.changeset(%Job{}, job_params)
      case Captcha.get() do
        {:ok, text, img_binary } ->
          conn
          |> fetch_session
          |> put_session(:img_text, text)
          |> render("new.html", captcha_error: captcha_error, img: Base.encode64(img_binary), changeset: %{changeset | action: :new})
      end
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

  defp notify_admins(conn, job) do
    url = ErlangjobsWeb.Router.Helpers.admin_job_path(conn, :show, job)
    spawn(Telegram, :notify_new_offer, [job, url])
    conn
  end
end
