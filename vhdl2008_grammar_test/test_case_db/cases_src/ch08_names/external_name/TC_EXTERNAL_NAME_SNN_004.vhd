-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name | external_signal_name | external_variable_name
-- Case Type: Negative
-- Test Focus: SNN: illegal entity class keyword — <<wire .path.name : bit>> uses 'wire' instead of 'constant/signal/variable'; external_name accepts only these three entity classes
-- Expected Result: Triggers syntax error at invalid entity class
-- Dependencies: None
-- =============================================================
entity ext_name_bad_class is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_name_bad_class is
  -- ERROR: 'wire' is not a valid external name entity class
  alias bad_ref is <<wire .tb.uut.clk : bit>>;
begin
  q <= d;
end architecture vhdl2008;
