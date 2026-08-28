-- =============================================================
-- Case ID: TC_ATTRIBUTE_DECLARATION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: ATTRIBUTE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.7
-- Test Focus: attribute_declaration: missing type_mark after colon
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ad2_e is end entity;
architecture bh of ad2_e is
  attribute a_bad : ;  -- ERROR: missing type_mark
begin end architecture;
