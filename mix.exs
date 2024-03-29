defmodule IceCreamBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :ice_cream_bot,
      version: "0.1.0",
      elixir: "~> 1.9",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {IceCreamBot.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.1"},
      {:jason, "~> 1.1.2"},
      {:slack, "~> 0.19.0"},
      {:poison, "~> 3.1"}
    ]
  end
end
