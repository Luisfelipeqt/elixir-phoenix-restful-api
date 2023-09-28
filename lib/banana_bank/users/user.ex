defmodule BananaBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_create [:name, :password, :email, :cep]
  @required_update [:name, :email, :cep]

  schema "users" do
    field(:cep, :string)
    field(:password_hash)
    field(:name, :string)
    field(:email, :string)
    field(:password, :string, virtual: true)

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_create)
    |> validate_required(@required_create)
    |> do_validations(@required_create)
    |> unique_constraint(:email)
    |> hash_password()
  end

  def changeset(user, params) do
    user
    |> cast(params, @required_create)
    |> do_validations(@required_update)
    |> hash_password()
  end

  defp do_validations(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:cep, min: 8, max: 9)
    |> validate_length(:name, min: 3, max: 100)
    |> validate_length(:email, min: 3, max: 100)
    |> validate_length(:password, min: 3, max: 255)
    |> validate_format(:email, ~r/@/, message: "Email deve conter @")
    |> validate_format(:cep, ~r/^\d{5}-\d{3}$/, message: "CEP deve estar no formato 12345-678")
    |> unique_constraint(:email)
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        hashed_password = Argon2.hash_pwd_salt(password)
        put_change(changeset, :password_hash, hashed_password)

      _ ->
        changeset
    end
  end
end
