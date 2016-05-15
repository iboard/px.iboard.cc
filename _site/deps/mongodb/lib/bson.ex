defmodule BSON do
  @moduledoc """
  Functions for encoding and decoding BSON documents.
  """

  @type t :: document | String.t | atom | number | boolean | BSON.Binary.t |
             BSON.ObjectId.t | BSON.DateTime.t | BSON.Regex.t |
             BSON.JavaScript.t | BSON.Timestamp.t | [t]
  @type document :: %{atom => BSON.t} | %{String.t => BSON.t} |
                    [{atom, BSON.t}] | [{String.t, BSON.t}]

  @doc """
  Encode a BSON document to `iodata`.
  """
  @spec encode(document) :: iodata
  def encode(map) when is_map(map) do
    BSON.Encoder.encode(map)
  end

  def encode([{_, _}|_] = keyword) do
    BSON.Encoder.encode(keyword)
  end

  @doc """
  Decode `iodata` to a BSON document.
  """
  @spec decode(iodata) :: document
  def decode(binary) when is_binary(binary) do
    BSON.Decoder.decode(binary)
  end

  def decode(list) when is_list(list) do
    IO.iodata_to_binary(list)
    |> BSON.Decoder.decode
  end
end
