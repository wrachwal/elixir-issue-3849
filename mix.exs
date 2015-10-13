defmodule Uex.Mixfile do
  use Mix.Project

  def project do
    [app: :uex,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     deps: deps,
     aliases: aliases]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      applications: [
        :logger, :gproc,
        :asn_rrc, :asn_s1ap, :asn_x2ap
      ],
      mod: {Uex.Application, []},
      env: [uex_config: "etc/uex.exs",
            ue_db_config: "etc/ue_db.exs"]
    ]
  end

  defp elixirc_paths(:dev), do: ["lib", "ct"]
  defp elixirc_paths(_),    do: ["lib"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:gproc, "0.3.1"},
     {:asn_rrc,  path: "asn/asn_rrc"},
     {:asn_s1ap, path: "asn/asn_s1ap"},
     {:asn_x2ap, path: "asn/asn_x2ap"},
     {:mfarn,    path: "mix/mfarn"}]
  end

  defp aliases do
    [compile: ["compile", "check"]]
  end
end
