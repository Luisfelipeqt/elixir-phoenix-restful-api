defmodule BananaBank.Users do
  alias BananaBank.Users.Get
  alias BananaBank.Users.Index
  alias BananaBank.Users.Create
  alias BananaBank.Users.Delete
  alias BananaBank.Users.Update
  alias BananaBank.Users.Verify

  defdelegate get(id), to: Get, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate index(), to: Index, as: :call
  defdelegate login(params), to: Verify, as: :call
  defdelegate create(params), to: Create, as: :call
  defdelegate update(params), to: Update, as: :call
end
