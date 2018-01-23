defmodule ErlangjobsWeb.JobView do
  use ErlangjobsWeb, :view
  import Scrivener.HTML

  def show_flash(conn) do
    get_flash(conn) |> flash_msg
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
