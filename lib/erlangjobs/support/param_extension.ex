defmodule Erlangjobs.Support.ParamExtension do
  import Ecto.Changeset

  def update_changeset(changeset, title) do 
    put_change(changeset, :slug, generate_slug(title))
  end

  def set_slug(current_changeset) do
    title = fetch_field(current_changeset, :title) |> elem(1)
    cond do
      get_change(current_changeset, :updated_at) != nil -> update_changeset(current_changeset, title)
      get_change(current_changeset, :title) != nil -> update_changeset(current_changeset, title)
      true -> current_changeset
    end
  end

  def generate_slug(value) do
    value
    |> String.downcase()
    |> transliterate
    |> String.replace(~r/[^a-z0-9\s-]/, "")
    |> String.replace(~r/(\s|-)+/, "-")
  end

  def transliterate(str) do
    case str do
      "" -> nil
      str -> Russian.transliterate(str)
    end
  end

end
