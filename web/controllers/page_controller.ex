defmodule Erlangjobs.PageController do
  use Erlangjobs.Web, :controller

  def about(conn, _params) do
    render(conn, "about.html")
  end

  def rules(conn, _params) do
    render(conn, "rules.html")
  end

  def contacts(conn, _params) do
    render(conn, "contacts.html")
  end
end
