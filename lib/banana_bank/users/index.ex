defmodule BananaBank.Users.Index do
  import Ecto.Query
  alias BananaBank.Repo
  alias BananaBank.Users.User

  def call() do
    from(a in User, select: a)
    |> Repo.all()
  end
end
