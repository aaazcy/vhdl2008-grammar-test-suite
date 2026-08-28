-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: variable_assignment_statement ::= [ label : ] target := expression ;
-- Case Type: Negative
-- Test Focus: SNN: Missing `:=` — `v_val 42;` lacks the assignment symbol between target and expression, verifying that variable_assignment requires `:=` as the mandatory separator
-- Expected Result: Triggers syntax error: missing ":=" in variable assignment
-- Dependencies: None
-- =============================================================
entity vas_snn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of vas_snn1_ent is signal s_res:integer:=0;
begin
  process(a)
    variable v_val:integer:=0;
  begin
    v_val a; s_res <= v_val;
  end process;
  y <= s_res;
end architecture bh;
