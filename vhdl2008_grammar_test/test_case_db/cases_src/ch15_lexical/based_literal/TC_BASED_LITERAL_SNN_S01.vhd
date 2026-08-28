-- =============================================================
-- Case ID: TC_BASED_LITERAL_SNN_S01
-- Rule Type: Syntax
-- BNF Production: BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.2
-- Test Focus: based_literal: base outside 2-16 range
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bl_e is end entity;
architecture bh of bl_e is
  constant C_BAD:integer:=1#1010#;  -- ERROR: base 1 is invalid
begin end architecture;
