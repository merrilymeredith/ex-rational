defmodule Rational.Mixfile do
  use Mix.Project

  def project do
    [app: :rational,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  defp deps do
    [
      {:earmark, "~> 0.0", only: :dev},
      {:ex_doc, "~> 0.0", only: :dev},
    ]
  end
end
