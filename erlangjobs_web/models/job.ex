defmodule ErlangjobsWeb.Job do
  use ErlangjobsWeb, :model

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
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :city, :is_remote, :salary, :email, :company, :site, :phone, :contact_name, :currency_type, :employment_type])
    |> validate_required([:title, :description, :city, :is_remote, :email, :company, :site])
  end
end
