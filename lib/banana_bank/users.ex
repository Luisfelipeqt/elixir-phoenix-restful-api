defmodule BananaBank.Users do
  alias BananaBank.Users.Get
  alias BananaBank.Users.Index
  alias BananaBank.Users.Create
  alias BananaBank.Users.Update
  alias BananaBank.Users.Delete

  defdelegate get(id), to: Get, as: :call
  defdelegate index(), to: Index, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate create(params), to: Create, as: :call
  defdelegate update(params), to: Update, as: :call
  defdelegate get_user_by_email(email), to: Get, as: :get_user_by_email
end
