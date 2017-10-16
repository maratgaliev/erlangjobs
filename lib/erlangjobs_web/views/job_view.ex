defmodule ErlangjobsWeb.JobView do
  use ErlangjobsWeb, :view
  import Scrivener.HTML

  def markdown(description) do
    description
    |> Earmark.as_html!
  end

  def translate_options(map) do
    for {k, v} <- Map.new(map), into: %{}, do: {Gettext.gettext(ErlangjobsWeb.Gettext, String.capitalize(Atom.to_string(k))), v}
  end

  #TODO
  def job_link(id), do: "#{ErlangjobsWeb.Endpoint.url}/jobs/#{id}"

  def date_format_rfc1123(inserted_at) do
    inserted_at
      |> Timex.to_datetime
      |> Timex.format!("{RFC1123}")
  end
end
