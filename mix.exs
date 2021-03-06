defmodule Cocu.Mixfile do
  use Mix.Project

  def project do
    [
      app: :cocu,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [
        tool: ExCoveralls
      ],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Cocu.Application, []},
      extra_applications: [:logger, :runtime_tools, :ex_aws, :hackney, :poison, :stripity_stripe]
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
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:credo, "~> 0.3", only: [:dev, :test]},
      {:cowboy, "~> 1.0"},
      {:distillery, "~> 1.5", runtime: false},
      {:timex, "~> 3.1"},
      {:guardian, "~> 1.0-beta"},
      {:comeonin, "~> 4.0"},
      {:bcrypt_elixir, "~> 0.12"},
      {:hackney, "~> 1.8"},
      {:ex_aws, "~> 1.1.5"},
      {:poison, "~> 3.1.0"},
      {:httpoison, "~> 0.13.0"},
      {:sweet_xml, "~> 0.6.5"},
      {:uuid, "~> 1.1"},
      {:stripity_stripe, "~> 1.6"},
      {:excoveralls, "~> 0.7", only: :test},
      {:httpotion, "~> 3.0.2"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.migrate", "test"],
      "ready": ["credo"]
    ]
  end
end
