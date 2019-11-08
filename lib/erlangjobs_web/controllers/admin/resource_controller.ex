defmodule ErlangjobsWeb.Admin.ResourceController do
  use ErlangjobsWeb, :controller

  plug :put_layout, "admin.html"

  alias Erlangjobs.Resources
  alias Erlangjobs.Resources.Resource

  def index(conn, params) do
    resources = Resources.list_admin_resources(params)
    render(conn, "index.html", resources: resources)
  end

  def new(conn, params) do
    changeset = Resource.changeset(%Resource{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resource" => resource_params}) do
    changeset = Resource.changeset(%Resource{}, resource_params)

    case Repo.insert(changeset) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Resource created successfully.")
        |> redirect(to: admin_resource_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resource = Repo.get!(Resource, id)
    render(conn, "show.html", resource: resource)
  end

  def edit(conn, %{"id" => id}) do
    resource = Repo.get!(Resource, id)
    changeset = Resource.changeset(resource)
    render(conn, "edit.html", resource: resource, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resource" => resource_params}) do
    resource = Repo.get!(Resource, id)
    changeset = Resource.changeset(resource, resource_params)

    case Repo.update(changeset) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Resource updated successfully.")
        |> redirect(to: admin_resource_path(conn, :index))
      {:error, changeset} ->
        render(conn, "edit.html", resource: resource, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource = Repo.get!(Resource, id)
    Repo.delete!(resource)
    conn
    |> put_flash(:info, "Resource deleted successfully.")
    |> redirect(to: admin_resource_path(conn, :index))
  end

end
