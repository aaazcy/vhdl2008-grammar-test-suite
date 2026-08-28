-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.4
-- Test Focus: physical_type_definition: missing "end units"
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ptd_e is end entity;
architecture bh of ptd_e is
  type t_bad is range 0 to 1000 units u;  -- ERROR: missing end units
  signal s:t_bad; begin end architecture;
