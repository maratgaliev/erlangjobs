defmodule ErlangjobsWeb.LayoutView do
  use ErlangjobsWeb, :view

  def page_title(conn) do
    title = "Elixir/Erlang Jobs - вакансии по Elixir/Erlang"
    if conn.assigns[:page_title] do
      "#{conn.assigns[:page_title]} - #{title}"
    else
      title
    end
  end
end
