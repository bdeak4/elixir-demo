defmodule Demo.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :nabavanet_id, :integer
    field :price, :decimal
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :price, :nabavanet_id])
    |> validate_required([:title, :price, :nabavanet_id])
  end
end
