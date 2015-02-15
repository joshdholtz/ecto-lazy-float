defmodule LazyFloat.Mixfile do
  use Mix.Project

  def project do
    [app: :ecto_lazy_float,
     version: "0.1.0",
     elixir: "~> 1.0",
     name: "Ecto.LazyFloat",
     description: description,
     package: package,
     deps: deps]
  end

  def application do
    []
  end

  defp deps do
    [{:ecto, ">= 0.5.0"}]
  end

  defp description do
    """
    Ecto.LazyFloat takes integer, strings, and floats and casts them to floats.
    """
  end

  defp package do
    [
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     contributors: ["Josh Holtz"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/joshdholtz/ecto-lazy-float"}
    ]
  end
end