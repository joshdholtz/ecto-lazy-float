defmodule LazyFloatTest do
  use ExUnit.Case
  alias Ecto.Repo
  import Ecto.Changeset
  
  defmodule TestModule do
    use Ecto.Model

    schema "test_module" do
      field :test_field, Ecto.LazyFloat
    end
  end

  describe "An attribute with LazyFloat" do
    test "casts an integer to a float correctly" do
      assert changeset_valid?(%{test_field: 1})
    end

    test "casts a string to an float correctly" do
      assert changeset_valid?(%{test_field: "0.1"})
      assert changeset_valid?(%{test_field: ".1"})
    end

    test "can receive an float correctly" do
      assert changeset_valid?(%{test_field: 1})
    end

    test "throws an error otherwise" do
      refute changeset_valid?(%{test_field: "wrong_value"})
      refute changeset_valid?(%{test_field: false})
      refute changeset_valid?(%{test_field: []})
      refute changeset_valid?(%{test_field: %{}})
    end
  end

  defp changeset_valid?(changes) do
    changeset = %TestModule{}
      |> cast(changes, ["test_field"], [])
      |> validate_change(:test_field, fn(_, v) -> if is_float(v), do: [] end)
      |> Map.get(:valid?)
  end
end
