defmodule Erlangjobs.Resources.Resource do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  alias Erlangjobs.Resources.Resource

  schema "resources" do
    field :title, :string
    field :url, :string
    field :description, :string
    timestamps()
  end

  @doc false
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :url, :description])
    |> validate_required([:title, :description, :url])
  end
end