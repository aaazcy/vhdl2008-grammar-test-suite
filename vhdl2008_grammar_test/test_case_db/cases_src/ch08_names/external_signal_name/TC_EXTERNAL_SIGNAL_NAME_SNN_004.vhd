-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Negative
-- Test Focus: SNN: missing colon of the subtype_indication — in <<signal .path.name integer>> the ':' colon separator between the pathname and the type is missing
-- Expected Result: Triggers syntax error at missing colon before subtype
-- Dependencies: None
-- =============================================================
entity ext_sig_miss_colon is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_sig_miss_colon is
  -- ERROR: Missing ':' between external_pathname and subtype_indication
  alias bad_ref is <<signal .tb.uut.clk bit>>;
begin
  q <= d;
end architecture vhdl2008;
