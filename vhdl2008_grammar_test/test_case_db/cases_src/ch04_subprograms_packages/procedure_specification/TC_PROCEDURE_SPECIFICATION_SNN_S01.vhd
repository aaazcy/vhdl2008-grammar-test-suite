-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SNN_S01
-- Rule Type: Syntax
-- BNF Production: PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Test Focus: procedure_specification: missing parameter list close paren
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity ps_e is end entity;
architecture bh of ps_e is
  procedure p_bad(signal v:out integer  -- ERROR: missing )
  is begin v<=0; end procedure;
  signal s:integer; begin p_bad(s); end architecture;
