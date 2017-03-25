defmodule PiperBot.Mixfile do
  use Mix.Project

  def project do
    [app: :piper_bot,
     version: "0.1.0",
     elixir: "~> 1.4.2",
     # build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: applications(Mix.env),
     mod: {PiperBot, []}]
  end
  defp applications(:dev), do: applications(:all) ++ [:remix]
  defp applications(_all), do: [:logger, :slack, :httpoison, :maru, :dotenv]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:slack, "~> 0.9.3"},
     {:httpoison, "~> 0.9.0"},
     {:hackney, "1.6.5", override: true},
     {:poison, "~> 3.0"},
     {:maru, "~> 0.10"},
     {:dotenv, "~> 2.0.0"},
     {:remix, "~> 0.0.1", only: :dev}]
  end
end
