defmodule Erlangjobs.Telegram do
  alias ErlangjobsWeb.JobView

  def post_offer(job, url) do
    job_place = JobView.job_place(job.is_remote)
    employment_type = JobView.employment_type(job.employment_type)

    salary_text = if job.salary, do: ", от #{job.salary} #{JobView.currency(job.currency_type)}", else: ""
    description = "_#{job.company} - #{job.city}_ (#{employment_type}, #{job_place}#{salary_text})"

    job_text = """
    *#{job.title}*
    #{description}

    #{url}
    """
    {:ok, %Nadia.Model.Message{}} = apply(telegram_client(), :send_message, [jobs_chat_id(), job_text, [parse_mode: "Markdown"]])
  end

  def notify_new_offer(job, url) do
    job_text = """
    *#{job.title}*
    Ссылка: #{url}
    """
    {:ok, %Nadia.Model.Message{}} = apply(telegram_client(), :send_message, [admins_chat_id(), job_text, [parse_mode: "Markdown"]])
  end

  defp jobs_chat_id, do: Application.fetch_env!(:nadia, :elixirjobs_chat_id)
  defp admins_chat_id, do: Application.fetch_env!(:nadia, :elixirjobs_admins_chat_id)
  defp telegram_client, do: Application.fetch_env!(:erlangjobs, __MODULE__)[:client]

end
