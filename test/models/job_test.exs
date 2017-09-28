defmodule Erlangjobs.JobTest do
  use Erlangjobs.ModelCase

  alias Erlangjobs.Job

  @valid_attrs %{city: "some content", company: "some content", contact_name: "some content", description: "some content", email: "some content", is_remote: true, phone: "some content", salary: "120.5", site: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Job.changeset(%Job{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Job.changeset(%Job{}, @invalid_attrs)
    refute changeset.valid?
  end
end
