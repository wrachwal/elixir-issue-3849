defmodule Asn.S1AP do
  @asnmod :asn_s1ap

  defmodule Erl_ do
    @asnfn0 [:encoding_rule, :bit_string_format, :legacy_erlang_types, :info]
    @erlfn0 [:module_info]

    def records_extracts(asnmod) do
      Record.extract_all(from: hrl_file(asnmod))
    end

    def constants(asnmod) do
      for {f, a} <- asnmod.module_info[:exports], a == 0, !Enum.member?(@asnfn0++@erlfn0, f), do: f
    end

    def asnfn0, do: @asnfn0

    defp hrl_file(asnmod) do
      Path.relative_to_cwd Path.expand Path.dirname(__ENV__.file) <> "/../src/#{asnmod}.hrl"
    end
  end

  require Record

  @asn_records Keyword.keys(Erl_.records_extracts @asnmod)
  def asn_records, do: @asn_records

  Enum.each Erl_.records_extracts(@asnmod), fn {k, v} ->
    Record.defrecord k, v
  end

  @asn_constants Erl_.constants(@asnmod)
  def asn_constants, do: @asn_constants

  Enum.each @asn_constants++Erl_.asnfn0, fn name ->
    defdelegate unquote(name)(), to: @asnmod
  end
end
