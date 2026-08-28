-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name | external_signal_name | external_variable_name
-- Case Type: Negative
-- Test Focus: SNN: entity class keyword misspelled — <<const .path.name : integer>> uses 'const' instead of 'constant'; all three branches of external_name begin with '<< constant/signal/variable', and the keyword must be spelled in full
-- Expected Result: Triggers syntax error at invalid keyword 'const'
-- Dependencies: None
-- =============================================================
entity ext_name_bad_kw is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_name_bad_kw is
  -- ERROR: 'const' is not a valid entity class keyword
  alias bad_ref is <<const .cfg.MAX : integer>>;
begin
  q <= d;
end architecture vhdl2008;
