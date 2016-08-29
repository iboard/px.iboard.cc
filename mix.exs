defmodule Iboard.Mixfile do
  use Mix.Project

  def project do
    [app: :iboard,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, 
       "coveralls.detail": :test, 
       "coveralls.post": :test, 
       "coveralls.html": :test],
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Iboard, []},
     applications: app_list(Mix.env)]
  end

  defp app_list(:test) do
    [:hound | app_list(:all)]
  end
  defp app_list(_) do
    [:phoenix, :phoenix_html, 
     :cowboy, :logger, :gettext, 
     :phoenix_ecto, :mongodb_ecto]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.1.4"},
     {:mongodb_ecto, ">= 0.0.0"},
     {:phoenix_ecto, "~> 2.0"},
     {:phoenix_html, "~> 2.4"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.9"},
     {:html_entities, "~> 0.3"},
     {:cowboy, "~> 1.0"},
     {:hound, "~> 1.0", only: :test },
     {:excoveralls, "~> 0.5", only: :test}]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end
