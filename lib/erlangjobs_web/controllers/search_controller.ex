defmodule ErlangjobsWeb.SearchController do
  use ErlangjobsWeb, :controller

  alias Erlangjobs.Offers
  alias Erlangjobs.Offers.Job
  
  def index(conn, params) do
    jobs = Offers.search_jobs(params)
    render(conn, "index.html", jobs: jobs)
  end
end
