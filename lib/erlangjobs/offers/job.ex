defmodule Erlangjobs.Offers.Job do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :slug}

  schema "jobs" do
    field :title, :string
    field :description, :string
    field :city, :string
    field :is_remote, :boolean, default: false
    field :salary, :decimal
    field :email, :string
    field :company, :string
    field :site, :string
    field :phone, :string
    field :contact_name, :string
    field :currency_type, :integer
    field :employment_type, :integer
    field :slug, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    params = Map.merge(params, slug_map(params))
    struct
    |> cast(params, [:slug, :updated_at, :title, :description, :city, :is_remote, :salary, :email, :company, :site, :phone, :contact_name, :currency_type, :employment_type])
    |> validate_required([:title, :description, :city, :is_remote, :email, :company, :site])
  end

  defp slug_map(%{"title" => title}) do
    slug = String.downcase(title) |> String.replace(" ", "-")
    %{"slug" => slug}
  end
  defp slug_map(_params) do
    %{}
  end

  defimpl Phoenix.Param, for: Erlangjobs.Offers.Job do
    def to_param(%{slug: slug}) do
      "#{slug}"
    end
  end
end
