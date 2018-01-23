defmodule Erlangjobs.Events.Event do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  alias Erlangjobs.Events.Event

  schema "events" do
    field :is_approved, :boolean, default: false
    field :title, :string
    field :address, :string
    field :description, :string
    field :registration_link, :string
    field :contact_email, :string
    field :contact_phone, :string
    field :city, :string
    field :start_date, Timex.Ecto.DateTime
    field :logo, ErlangjobsWeb.Logo.Type
    timestamps()
  end

  @doc false
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:is_approved, :title, :address, :description, :city, :registration_link, :contact_email, :contact_phone, :city, :start_date])
    |> cast_attachments(params, [:logo])
    |> set_date_value
    |> validate_required([:title, :description, :address, :city, :start_date])
  end

  def set_date_value(changeset) do
    date = fetch_field(changeset, :start_date) |> elem(1)
    cond do
      date != nil -> put_change(changeset, :start_date, date |> Timex.to_datetime)
      true -> changeset
    end
  end

  def set_date_value(changeset = %Ecto.Changeset{}), do: changeset
end