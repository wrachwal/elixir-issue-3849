defmodule Asn.RRC.Mixfile do
  use Mix.Project

  def project do
    [app: :asn_rrc,
     version: "12.6.0",
     compilers: [:asn1] ++ Mix.compilers,
     asn1_options: [:uper,        # Unaligned PER
                    :undec_rest], # to decode MIB/SIB(s) with 0 padding
     deps: deps()]
  end

  defp deps do
    [{:asn1ex, git: "https://github.com/vicentfg/asn1ex.git"}]
  end
end
