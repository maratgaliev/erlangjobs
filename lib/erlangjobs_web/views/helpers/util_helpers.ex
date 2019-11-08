defmodule ErlangjobsWeb.UtilHelpers do
  use Phoenix.HTML

  def flash_msg(%{"info" => msg}) do
    ~E"<div class='alert alert-info'><%= msg %></div>"
  end

  def flash_msg(%{"error" => msg}) do
    ~E"<div class='alert alert-danger'><%= msg %></div>"
  end

  def flash_msg(_) do
    nil
  end

  def markdown(description) do
    description
    |> Earmark.as_html!
  end

  def human_time_format(inserted_at) do
    inserted_at
      |> Timex.to_datetime
      |> Timex.format!("%d-%m-%Y", :strftime)
  end
end
