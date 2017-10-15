defmodule Erlangjobs.Twitter do

  @doc """
  Post a job in twitter
  """
  def tweet_job(job) do
    link = ErlangjobsWeb.JobView.job_link(job.id)
    tags = "#job #elixirlang"
    message = "#{job.title} @ #{job.company} #{tags} #{link}"
    apply(twitter_client(), :update, [message])
  end

  defp twitter_client, do: Application.fetch_env!(:erlangjobs, __MODULE__)[:client]
end
