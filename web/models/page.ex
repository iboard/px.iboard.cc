defmodule Iboard.Page do
  use Iboard.Web, :model

  schema "pages" do
    field :title, :string
    field :body, :string
    timestamps
  end

  @required_fields ~w(title)
  @optional_fields ~w(body)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end

  def preview(model) do
    if String.length(model.body) > 254 do
      String.slice(model.body, 0..250) <> "... "
    else
      model.body
    end
  end

end
