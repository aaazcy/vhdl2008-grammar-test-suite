-- =============================================================
-- Case ID: TC_VARIABLE_DECLARATION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Test Focus: variable_declaration: shared variable outside declarative item
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity vd_e is end entity;
architecture bh of vd_e is
  shared variable sv_bad:integer:=0  -- ERROR: missing ;
begin end architecture;
