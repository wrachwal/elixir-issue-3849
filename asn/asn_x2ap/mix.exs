defmodule Asn.X2AP.Mixfile do
  use Mix.Project

  def project do
    [app: :asn_x2ap,
     version: "12.4.2",
     compilers: [:asn1] ++ Mix.compilers,
     asn1_options: [:per],  # Aligned PER
     deps: deps()]
  end

  defp deps do
    [{:asn1ex, git: "https://github.com/vicentfg/asn1ex.git"}]
  end
end
