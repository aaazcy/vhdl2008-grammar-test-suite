-- =============================================================
-- Case ID: TC_ARRAY_TYPE_DEFINITION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: ARRAY_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Test Focus: array_type_definition: malformed index constraint
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity atd_e is end entity;
architecture bh of atd_e is
  type t_bad is array(0 to) of integer;  -- ERROR: missing upper bound
  signal s:t_bad; begin end architecture;
