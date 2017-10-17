defmodule ErlangjobsTest.TwitterTest do
  use ErlangjobsTest.DataCase

  alias Erlangjobs.Twitter
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

    test "tweet_job/1 returns new tweet from job" do
      job = job_fixture()
      link = "http://localhost:4001/jobs/#{job.id}"
      tweet = Twitter.tweet_job(job, link)
      assert %ExTwitter.Model.Tweet{} = tweet
      assert tweet.text == "#{job.title} @ #{job.company} #job #elixirlang #{link}"
    end
  end
end
