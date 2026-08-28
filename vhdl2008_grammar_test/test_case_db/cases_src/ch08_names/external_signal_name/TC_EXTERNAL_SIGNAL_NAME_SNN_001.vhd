-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: SNN: missing 'signal' keyword — <<.path.name : bit>> starts directly with the dot path, missing the required 'signal' entity class keyword
-- Expected Result: Triggers syntax error at missing 'signal' keyword
-- Dependencies: None
-- =============================================================
entity ext_sig_miss_kw is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_sig_miss_kw is
  -- ERROR: Missing 'signal' keyword after '<<'
  alias bad_ref is <<.tb.uut.clk : bit>>;
begin
  q <= d;
end architecture vhdl2008;
