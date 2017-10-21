defmodule ErlangjobsTest.TelegramTest do
  use ErlangjobsTest.DataCase

  alias Erlangjobs.Telegram
  alias Erlangjobs.Offers

  describe "twitter methods" do

    @valid_attrs %{city: "some title", company: "some company", contact_name: "some contact_name",
      description: "some description", email: "some email", is_remote: true, phone: "some phone", salary: "120.5",
      site: "some site", title: "some title", currency_type: 0, employment_type: 0}

    def job_fixture(attrs \\ %{}) do
      {:ok, job} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Offers.create_job()

      job
    end

    test "post/2 returns new post from job" do
      job = job_fixture()
      link = "http://localhost:4001/jobs/#{job.id}"
      post = Telegram.post(job, link)
      assert {:ok, _} = post
    end
  end
end
