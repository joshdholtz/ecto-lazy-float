# Ecto.LazyFloat
Ecto.LazyFloat - An Ecto.Float that accepts binary and integers

Find on Hex - https://hex.pm/packages/ecto_lazy_float

## Installation
Add Ecto.LazyFloat as a dependency in your `mix.exs` file.

```elixir
defp deps do
  [{:postgrex, ">= 0.0.0"},
   {:ecto, "~> 0.7"},
   {:ecto_lazy_float, "~> 0.1.2"}]
end
```

After you are done, run `mix deps.get` in your shell to fetch the dependencies.

## Usage

Enable LazyFloat through an Ecto model schema:

```elixir
defmodule YourProject.Thing do
  use Ecto.Model

  schema "things" do
    field :notes, :string
    field :position, :integer
    field :value, Ecto.LazyFloat
  end
end
```

```elixir
# With integer
valid = Ecto.Changeset.cast(%{value: 1}, %Thing{}, [], [])
Repo.insert(valid)

# With string
valid = Ecto.Changeset.cast(%{value: "1.2"}, %Thing{}, [], [])
Repo.insert(valid)

# With float
valid = Ecto.Changeset.cast(%{value: 1.2}, %Thing{}, [], [])
Repo.insert(valid)
```
