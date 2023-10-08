defmodule BananaBankWeb.UsersControllerTest do
  # Usar ConnCase para setar um banco de dados em SandBOX
  # SandBox significa que tudo
  # Que é feito no teste é feito automáticamente rollback depois
  alias BananaBank.Users
  alias Users.User
  use BananaBankWeb.ConnCase, async: true

  describe "create/2" do
    test "criando um usuário com sucesso", %{conn: conn} do
      params = %{
        name: "Luis Felipe Rodrigues",
        cep: "65067-197",
        email: "luisfelipebr1995@gmail.com",
        password: "123456789"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "data" => %{
                 "cep" => "65067-197",
                 "email" => "luisfelipebr1995@gmail.com",
                 "name" => "Luis Felipe Rodrigues"
               },
               "message" => "User criado com sucesso!"
             } = response
    end

    test "criando usuário com dados invalidos e retornando error", %{conn: conn} do
      params = %{
        name: "Lu",
        cep: "65",
        email: "lui",
        password: "1"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{"status" => "bad_request"}

      assert response == expected_response
    end
  end
end
