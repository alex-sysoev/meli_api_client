defmodule MeliApiClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :meli_api_client,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison,  "~> 1.5"},
      {:poison, "~> 3.1"},
      {:timex, "~> 3.1"},
      {:dialyxir, "~> 1.0.0-rc.6", only: [:dev], runtime: false}
    ]
  end

  defp aliases() do
    [
      test_all: ["test --trace --include integration"]
    ]
  end
end
