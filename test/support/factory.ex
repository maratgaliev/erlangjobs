defmodule Erlangjobs.Factory do
  use ExMachina.Ecto, repo: Erlangjobs.Repo

  alias Erlangjobs.Offers.Job

  def job_factory do
    %Job{
      title: sequence(:title, &"Job #{&1}"),
      description: "Lorem ipsum",
      is_remote: true,
      email: sequence(:email, &"job_email-#{&1}@example.com"),
      company: "Test Company LLC",
      site: "http://www.site.com",
      city: "Kazan"
    }
  end

end