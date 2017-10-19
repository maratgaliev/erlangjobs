defmodule Erlangjobs.IntegrationCase do
  use ExUnit.CaseTemplate
  use Hound.Helpers
  import Erlangjobs.Factory

  alias Erlangjobs.Repo
  alias Erlangjobs.Offers.Job

  using do
    quote do
      use Hound.Helpers

      import Ecto, only: [build_assoc: 2]
      import Ecto.Query, only: [from: 2]
      import ErlangjobsWeb.Router.Helpers

      import Erlangjobs.Factory
      import Erlangjobs.IntegrationCase

      
      alias Erlangjobs.Repo

      @endpoint ErlangjobsWeb.Endpoint

      hound_session()
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Erlangjobs.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Erlangjobs.Repo, {:shared, self()})
    end

    :ok
  end

  def create_job do
    build(:job)
    |> Job.changeset(%{title: "New Job"})
    |> Repo.insert!
  end

end