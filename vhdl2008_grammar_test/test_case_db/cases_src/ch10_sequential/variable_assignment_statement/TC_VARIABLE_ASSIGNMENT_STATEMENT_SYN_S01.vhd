-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- BNF Production: VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Test Focus: Variable assignment statement: [label:] variable_name := expression; — labelled/standalone variable assignment
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_variable_assignment_statement_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_variable_assignment_statement_syn_s01 is
  signal s_vas:integer:=0;
begin
  process is variable v:integer; begin
    v:=42; s_vas<=v; wait; end process;
  r<=s_vas;end architecture bh;
