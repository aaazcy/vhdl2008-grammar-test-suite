-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Test Focus: record_type_definition: missing "end record"
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity rtd_e is end entity;
architecture bh of rtd_e is
  type t_bad is record a:integer; b:bit;  -- ERROR: missing end record
  signal s:t_bad; begin end architecture;
