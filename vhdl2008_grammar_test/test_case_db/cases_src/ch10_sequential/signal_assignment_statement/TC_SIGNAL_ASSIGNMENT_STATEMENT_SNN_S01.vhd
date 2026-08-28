-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SNN_S01
-- Rule Type: Syntax
-- BNF Production: SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Test Focus: signal_assignment_statement: wrong assignment operator
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sas_e is port(r:out integer); end entity;
architecture bh of sas_e is
  signal s:integer:=0;
begin
  s=42;  -- ERROR: = used instead of <=
  r<=s;
end architecture;
