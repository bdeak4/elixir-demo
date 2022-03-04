defmodule Demo.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :price, :decimal
      add :nabavanet_id, :integer

      timestamps()
    end
  end
end
