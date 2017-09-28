defmodule Erlangjobs.JobView do
  use Erlangjobs.Web, :view
  import Scrivener.HTML
  
  def markdown(description) do
    description
    |> Earmark.to_html
    |> raw
  end

  def translate_options(map) do
    for {k, v} <- Map.new(map), into: %{}, do: {Gettext.gettext(Erlangjobs.Gettext, String.capitalize(Atom.to_string(k))), v}
  end
end