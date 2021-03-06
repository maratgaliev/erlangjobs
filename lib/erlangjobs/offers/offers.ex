defmodule Erlangjobs.Offers do
  @moduledoc """
  The Offers context.
  """

  import Ecto.Query, warn: false
  alias Erlangjobs.Repo

  alias Erlangjobs.Offers.Job
  alias Erlangjobs.Offers.Queries.Job, as: JobQuery

  @doc """
  Returns the list of jobs.

  ## Examples

      iex> list_jobs()
      [%Job{}, ...]

  """
  def list_admin_jobs(params \\ %{}) do
    Job
    |> JobQuery.order_id_desc()
    |> Repo.paginate(params)
  end

  @doc """
  Returns the list of jobs.

  ## Examples

      iex> list_jobs()
      [%Job{}, ...]

  """
  def list_jobs(params \\ %{}) do
    Job
    |> JobQuery.approved()
    |> JobQuery.order_id_desc()
    |> Repo.paginate(params)
  end

  @doc """
  Returns the search results jobs.

  ## Examples

      iex> search_jobs(params)
      [%Job{}, ...]

  """
  def search_jobs(params) do
    search_term = get_in(params, ["search", "query"])
    if search_term do
      Job
      |> JobQuery.approved()
      |> JobQuery.order_id_desc()
      |> JobQuery.search(search_term)
      |> Repo.all()
    else
      []
    end
  end


  @doc """
  Gets a single job.

  Raises `Ecto.NoResultsError` if the Job does not exist.

  ## Examples

      iex> get_job!(123)
      %Job{}

      iex> get_job!(456)
      ** (Ecto.NoResultsError)

  """
  def get_job!(id) do
    Job
    |> JobQuery.approved()
    |> Repo.get!(id)
  end

  @doc """
  Creates a job.

  ## Examples

      iex> create_job(%{field: value})
      {:ok, %Job{}}

      iex> create_job(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_job(attrs \\ %{}) do
    %Job{}
    |> Job.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a job.

  ## Examples

      iex> update_job(job, %{field: new_value})
      {:ok, %Job{}}

      iex> update_job(job, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_job(%Job{} = job, attrs) do
    job
    |> Job.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Job.

  ## Examples

      iex> delete_job(job)
      {:ok, %Job{}}

      iex> delete_job(job)
      {:error, %Ecto.Changeset{}}

  """
  def delete_job(%Job{} = job) do
    Repo.delete(job)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking job changes.

  ## Examples

      iex> change_job(job)
      %Ecto.Changeset{source: %Job{}}

  """
  def change_job(%Job{} = job) do
    Job.changeset(job, %{})
  end
end
