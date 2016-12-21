defmodule Ecto.LazyFloat do

  def type, do: :float

  def cast(""), do: {:ok, nil}
  def cast(string) when is_binary(string) do
    if Regex.match?(~r/^\.[0-9]+$/, string), do: string = "0" <> string
    case Float.parse(string) do
      {float, _} -> {:ok, float}
      :error   -> :error
    end
  end
  def cast(integer) when is_integer(integer) do
    case Float.parse(to_string(integer)) do
      {float, _} -> {:ok, float}
      :error   -> :error
    end
  end
  def cast(float) when is_float(float), do: {:ok, float}
  def cast(_), do: :error

  def blank?(_), do: false
  
  def load(float) when is_float(float), do: {:ok, float}
  def load(integer) when is_integer(integer), do: {:ok, integer / 1}
  def load(_), do: :error
  
  def dump(float) when is_float(float), do: {:ok, float}
  def dump(_), do: :error
end
