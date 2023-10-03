defmodule BananaBank.ViaCep.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws"
  plug Tesla.Middleware.JSON

  def call(cep) do
    "/#{cep}/json"
    |> get()
    |> handle_response()
  end

  # Caso de :ok mas que retorna um "erro"
  defp handle_response({:ok, %Tesla.Env{status: 200, body: %{"erro" => true}}}) do
    {:error, :not_found}
  end

  # Caso de :ok mas que retorna um body com os dados corretos
  defp handle_response({:ok, %Tesla.Env{status: 200, body: body}}) do
    {:ok, body}
  end

  # Caso de :ok mas que retorna um 400
  defp handle_response({:ok, %Tesla.Env{status: 400}}) do
    {:error, :bad_request}
  end

  # Caso de :error que é genérico, retorna qualquer coisa que seja um :error
  defp handle_response({:error, _}) do
    {:error, :internal_server_error}
  end
end
