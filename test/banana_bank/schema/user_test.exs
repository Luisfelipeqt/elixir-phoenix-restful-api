defmodule BananaBank.Schema.UserTest do
  use ExUnit.Case
  alias BananaBank.Users.User

  @expected_fields_with_types [
    {:id, :binary_id},
    {:cep, :string},
    {:name, :string},
    {:email, :string},
    {:password_hash, :string},
    {:inserted_at, :naive_datetime},
    {:updated_at, :naive_datetime}
  ]

  describe "fields and types" do
    test "it has the correct fields and types" do
      actual_fields_with_types =
        for field <- User.__schema__(:fields) do
          type = User.__schema__(:type, field)
          {field, type}
        end

      assert MapSet.new(actual_fields_with_types) == MapSet.new(@expected_fields_with_types)
    end
  end
end
