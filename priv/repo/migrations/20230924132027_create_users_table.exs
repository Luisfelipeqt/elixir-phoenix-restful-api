defmodule BananaBank.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:name, :string, null: false)
      add(:password_hash, :string, null: false)
      add(:email, :string, null: false)
      add(:cep, :string, null: false)

      timestamps()
    end

    create(unique_index(:users, [:email]))
    create(index(:users, [:name]))
  end
end