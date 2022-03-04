defmodule Demo.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Demo.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        nabavanet_id: 42,
        price: "120.5",
        title: "some title"
      })
      |> Demo.Catalog.create_product()

    product
  end
end
