-- =============================================================
-- Case ID: TC_SIGNAL_DECLARATION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Test Focus: signal_declaration: missing colon after identifier
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sd_e is end entity;
architecture bh of sd_e is
  signal s_bad integer;  -- ERROR: missing :
begin end architecture;
