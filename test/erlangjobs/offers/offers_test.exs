defmodule ErlangjobsTest.OffersTest do
  use ErlangjobsTest.DataCase

  alias Erlangjobs.Offers

  describe "jobs" do
    alias Erlangjobs.Offers.Job

    @valid_attrs %{city: "some title", company: "some company", contact_name: "some contact_name",
      description: "some description", email: "some email", is_remote: true, phone: "some phone", salary: "120.5",
      site: "some site", title: "some title", currency_type: 0, employment_type: 0}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def job_fixture(attrs \\ %{}) do
      {:ok, job} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Offers.create_job()

      job
    end

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert Offers.list_jobs().entries == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert Offers.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      assert {:ok, %Job{} = job} = Offers.create_job(@valid_attrs)
      assert job.title == "some title"
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Offers.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      assert {:ok, job} = Offers.update_job(job, @update_attrs)
      assert %Job{} = job
      assert job.title == "some updated title"
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = Offers.update_job(job, @invalid_attrs)
      assert job == Offers.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = Offers.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> Offers.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = Offers.change_job(job)
    end
  end
end
