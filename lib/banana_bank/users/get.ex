defmodule BananaBank.Users.Get do
  alias BananaBank.Repo
  alias BananaBank.Users.User
  import Ecto.Query

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def get_user_by_email(email) when is_binary(email) do
    User
    |> where(email: ^email)
    |> preload(:account)
    |> Repo.one()
  end
end
