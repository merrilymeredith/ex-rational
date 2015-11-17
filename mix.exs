defmodule Rational.Mixfile do
  use Mix.Project

  def project do
    [app: :rational,
     version: "0.0.1",
     name: "Rational",
     source_url: "https://github.com/merrilymeredith/ex-rational",
     homepage_url: "https://github.com/merrilymeredith/ex-rational",
     elixir: "~> 1.1",
     deps: deps,
     docs: [
       main: Rational,
       extras: ["README.md"]]]
  end

  defp deps do
    [{:earmark, "~> 0.0", only: :dev},
     {:ex_doc, "~> 0.0", only: :dev},
     {:credo, "~> 0.1.0", only: :dev}]
  end
end
