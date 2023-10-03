defmodule BananaBankWeb.ErrorJSON do
  def render(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def error(%{changeset: changeset}) do
    %{
      errors: Ecto.Changeset.traverse_errors(changeset, &translate_errors/1)
    }
  end

  def error(%{status: :not_found}) do
    %{
      status: :not_found,
      message: "User not found!"
    }
  end


   def error(%{status: :bad_request}) do
    %{
      status: :bad_request,
      message: "You make a bad_request!"
    }
  end




  defp translate_errors({msg, opts}) do
    Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
      opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
    end)
  end
end
