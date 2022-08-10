defmodule Xadara.MixProject do
  use Mix.Project

  def project do
    [
      app: :xadara,
      version: "0.1.0",
      elixir: "~> 1.13",
      description: "Xadara Web APi",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      author: "github.com/vKxni",
      docs: [
        main: "readme",
        extras: [
          "README.md"
        ]
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Xadara.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      # phoenix server
      {:phoenix, "~> 1.6.10"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.18"},
      {:plug_cowboy, "~> 2.5"},

      # http
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"},
      {:jason, "~> 1.3"},

      # rate limit
      {:hammer, "~> 6.1"},

      # dotenv
      {:dotenv_parser, "~> 2.0"},

      # cors
      {:corsica, "~> 1.2"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get"]
    ]
  end
end
