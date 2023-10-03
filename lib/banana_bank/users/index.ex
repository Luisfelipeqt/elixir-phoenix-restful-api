defmodule BananaBank.Users.Index do
  import Ecto.Query
  alias BananaBank.Repo
  alias BananaBank.Users.User

  def call() do
    User
    |> Repo.all()
  end
end
