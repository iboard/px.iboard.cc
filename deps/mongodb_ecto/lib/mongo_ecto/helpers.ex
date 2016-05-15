defmodule Mongo.Ecto.Helpers do
  @moduledoc """
  Defines helpers to ease working with MongoDB in models or other places
  where you work with them. You'd probably want to import it.
  """

  @doc """
  Allows using inline JavaScript in queries in where clauses and inserting it
  as a value to the database.

  The second argument acts as a context for the function. All values will be
  converted to valid BSON types.

  Raises ArgumentError if any of the values cannot be converted.

  ## Usage in queries

      from p in Post,
        where: ^javascript("this.value === value", value: 1)
  """
  @spec javascript(String.t, Keyword.t) :: Mongo.Ecto.JavaScript.t
  def javascript(code, scope \\ []) do
    case Mongo.Ecto.Encoder.encode(scope, nil) do
      {:ok, []} ->
        %Mongo.Ecto.JavaScript{code: code}
      {:ok, scope} ->
        %Mongo.Ecto.JavaScript{code: code, scope: scope}
      :error ->
        raise ArgumentError, "invaid expression for JavaScript scope"
    end
  end

  @doc """
  Creates proper regex object that can be passed to the database.

  ## Usage in queries

      from p in Post,
        where: fragment(title: ^regex("elixir", "i"))

  For supported options please see `Mongo.Ecto.Regex` module documentation.
  """
  @spec regex(String.t, String.t) :: Mongo.Ecto.Regex.t
  def regex(pattern, options \\ "") do
    %Mongo.Ecto.Regex{pattern: pattern, options: options}
  end

  @doc """
  Allows updating only a fragment of a nested document

  ## Usage in queries

      MyRepo.update_all(Post,
        set: [meta: change_map("author.name", "NewName")])
  """
  @spec change_map(String.t, term) :: Mongo.Ecto.ChangeMap.t
  def change_map(field, value) do
    %Mongo.Ecto.ChangeMap{field: field, value: value}
  end

  @doc """
  Allows updating only a fragment of a nested document inside an array

  ## Usage in queries

      MyRepo.update_all(Post,
        set: [comments: change_array(0, "author", "NewName")])
  """
  @spec change_array(pos_integer, String.t, term) :: Mongo.Ecto.ChangeArray.t
  def change_array(idx, field \\ "", value) when is_integer(idx) do
    %Mongo.Ecto.ChangeArray{field: "#{idx}.#{field}", value: value}
  end
end
