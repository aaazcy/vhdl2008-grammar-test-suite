-- =============================================================
-- Case ID: TC_ENUMERATION_TYPE_DEFINITION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: ENUMERATION_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.2
-- Test Focus: enumeration_type_definition: missing closing paren
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity etd_e is end entity;
architecture bh of etd_e is
  type t_bad is (RED, GREEN, BLUE;  -- ERROR: missing )
  signal s:t_bad; begin end architecture;
