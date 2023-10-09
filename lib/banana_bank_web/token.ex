defmodule BananaBankWeb.Token do
  alias BananaBankWeb.Endpoint
  alias Phoenix.Token

  @sign_salt "Ro6d6/JV/JD+5MNTEmy9S+hqbeAJbDOfTrpS759KNmuCEEiKsHTSQGT7BxLuqtZH"

  def sign(user) do
    Token.sign(Endpoint, @sign_salt, %{user_id: user.id})
  end

  def verify(token), do: Token.verify(Endpoint, @sign_salt, token)
end
