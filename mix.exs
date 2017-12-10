defmodule SimpleCan.Mixfile do
  use Mix.Project

  def project do
    [
      app: :simple_can,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      consolidate_protocols: Mix.env != :test,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/craig-day/simple_can",
      homepage_url: "https://github.com/craig-day/simple_can",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
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
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "A simple library to facilitate authorization."
  end

  defp package() do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Craig Day"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/craig-day/simple_can"}
    ]
  end
end
