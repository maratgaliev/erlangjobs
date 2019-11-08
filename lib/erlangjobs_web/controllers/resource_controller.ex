defmodule ErlangjobsWeb.ResourceController do
  use ErlangjobsWeb, :controller

  alias Erlangjobs.Resources
  alias Erlangjobs.Resources.Resource

  def index(conn, params) do
    page = Resources.list_resources(params)
    render(conn, "index.html", resources: page.entries, page: page)
  end

  def new(conn, _params) do
    changeset = Resources.change_resource(%Resource{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"resource" => resource_params}) do
    case Resources.create_resource(resource_params) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Событие успешно создано, и будет добавлено на сайт после проверки")
        |> redirect(to: resource_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    resource = Resources.get_resource!(id)
    render(conn, "show.html", resource: resource, page_title: resource.title)
  end

  def edit(conn, %{"id" => id}) do
    resource = Resources.get_resource!(id)
    changeset = Resources.change_resource(resource)
    render(conn, "edit.html", resource: resource, changeset: changeset)
  end

  def update(conn, %{"id" => id, "resource" => resource_params}) do
    resource = Resources.get_resource!(id)

    case Resources.update_resource(resource, resource_params) do
      {:ok, resource} ->
        conn
        |> put_flash(:info, "Resource updated successfully.")
        |> redirect(to: resource_path(conn, :show, resource))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", resource: resource, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    resource = Resources.get_resource!(id)
    {:ok, _resource} = Resources.delete_resource(resource)

    conn
    |> put_flash(:info, "Resource deleted successfully.")
    |> redirect(to: resource_path(conn, :index))
  end
end
