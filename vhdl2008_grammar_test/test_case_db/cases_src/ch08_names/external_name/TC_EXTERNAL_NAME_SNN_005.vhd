-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name | external_signal_name | external_variable_name
-- Case Type: Negative
-- Test Focus: SNN: missing entity class keyword — <<.path.name : integer>> begins directly with a dot-leading path, missing the required 'constant/signal/variable' keyword; all three branches of external_name require an entity class keyword
-- Expected Result: Triggers syntax error at missing entity class keyword
-- Dependencies: None
-- =============================================================
entity ext_name_miss_class is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of ext_name_miss_class is
  -- ERROR: Missing entity class keyword before external_pathname
  alias bad_ref is <<.cfg_pkg.MAX : integer>>;
begin
  q <= d;
end architecture vhdl2008;
