defmodule BananaBankWeb.AccountsController do
  use BananaBankWeb, :controller
  alias Accounts.Account
  alias BananaBank.Accounts
  alias BananaBank.Accounts.Account
  alias BananaBankWeb.FallbackController

  action_fallback(FallbackController)

  def create(conn, params) do
    with {:ok, %Account{} = account} <- Accounts.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, account: account)
    end
  end
end
