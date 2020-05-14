defmodule ErlangjobsWeb.JobView do
  use ErlangjobsWeb, :view
  import Scrivener.HTML

  def show_flash(conn) do
    get_flash(conn) |> flash_msg
  end
end
