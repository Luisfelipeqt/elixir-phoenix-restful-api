defmodule BananaBankWeb.UsersController do
  use BananaBankWeb, :controller
  alias BananaBank.Users
  alias BananaBank.Users.User
  alias BananaBankWeb.FallbackController

  action_fallback(FallbackController)

  def index(conn, _params) do
    users = Users.index()

    conn
    |> render(:index, users: users)
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Users.get(id) do
      conn
      |> put_status(:ok)
      |> render(:get, user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Users.update(params) do
      conn
      |> put_status(:ok)
      |> render(:update, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Users.delete(id) do
      send_resp(conn, :no_content, "")
    end
  end
end