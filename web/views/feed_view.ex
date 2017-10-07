defmodule Erlangjobs.FeedView do
  use Erlangjobs.Web, :view

  def parse_markdown(markdown), do: Earmark.as_html!(markdown)

  def job_link(id), do: "#{Erlangjobs.Endpoint.url}/#job_#{id}"

  def date_format(inserted_at) do
    inserted_at
      |> Timex.to_datetime
      |> Timex.format!("{RFC1123}")
  end
end
