-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SNN_S01
-- Rule Type: Syntax
-- BNF Production: VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Test Focus: variable_assignment_statement: variable assign with signal operator
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity vas_e is port(r:out integer); end entity;
architecture bh of vas_e is
  signal s:integer:=0;
begin
  process is
    variable v:integer;
  begin
    v<=42;  -- ERROR: <= used for variable assignment
    s<=v; wait;
  end process;
end architecture;
