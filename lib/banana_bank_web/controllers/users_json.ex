defmodule BananaBankWeb.UsersJSON do
  alias BananaBank.Users.User

  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  def create(%{user: user}) do
    %{
      message: "User criado com sucesso!",
      data: data(user)
    }
  end

  def get(%{user: user}), do: %{data: data(user)}
  def delete(%{}), do: %{message: "Usuário deletado com sucesso!"}

  def update(%{user: user}), do: %{message: "Usuário atualizado com sucesso!", data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      name: user.name,
      email: user.email,
      update_at: user.updated_at,
      inserted_at: user.inserted_at
    }
  end
end
