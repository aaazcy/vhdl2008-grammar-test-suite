-- =============================================================
-- Case ID: TC_CONSTANT_DECLARATION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4
-- Test Focus: constant_declaration: deferred constant with := (not allowed)
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity cd_e is end entity;
architecture bh of cd_e is
  constant C_BAD integer:=0;  -- ERROR: missing :
begin end architecture;
