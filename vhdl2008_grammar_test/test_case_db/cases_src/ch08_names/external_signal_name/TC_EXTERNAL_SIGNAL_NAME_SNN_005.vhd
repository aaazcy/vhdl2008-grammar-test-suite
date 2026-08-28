-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: SNN: unclosed external_signal_name — <<signal .path.name : integer > has only a single '>' and is missing the required '>>' double-angle-bracket closure; an external_name must end with '>>'
-- Expected Result: Triggers syntax error at missing closing '>>'
-- Dependencies: None
-- =============================================================
entity ext_sig_unclosed is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_sig_unclosed is
  -- ERROR: Only one '>' — must be '>>' to close external name
  alias bad_ref is <<signal .tb.top.clk : bit >;
begin
  q <= d;
end architecture vhdl2008;
