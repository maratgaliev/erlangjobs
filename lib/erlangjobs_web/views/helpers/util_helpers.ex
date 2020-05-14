defmodule ErlangjobsWeb.UtilHelpers do
  use Phoenix.HTML
  import Scrivener.HTML

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
      |> Timex.format!("%d/%m/%Y", :strftime)
  end

  def translate_options(map) do
    for {k, v} <- Map.new(map), into: %{}, do: {Gettext.gettext(ErlangjobsWeb.Gettext, String.capitalize(Atom.to_string(k))), v}
  end

  def date_format_rfc1123(inserted_at) do
    inserted_at
      |> Timex.to_datetime
      |> Timex.format!("{RFC1123}")
  end

  def employment_type(type) do
    Gettext.gettext(ErlangjobsWeb.Gettext, String.capitalize(Atom.to_string(elem(EmploymentTypeEnum.load(type), 1))))
  end

  def job_place(is_remote) do
    case is_remote do
      true -> "Удаленка"
      false -> "Офис"
    end
  end

  def currency(currency_type) do
    elem(CurrencyTypeEnum.load(currency_type), 1)
  end
end
