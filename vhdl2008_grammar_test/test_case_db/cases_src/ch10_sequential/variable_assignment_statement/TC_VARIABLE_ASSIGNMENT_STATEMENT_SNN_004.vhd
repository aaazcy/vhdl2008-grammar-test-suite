-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: variable_assignment_statement ::= [ label : ] target := expression ;
-- Case Type: Negative
-- Test Focus: SNN: Missing trailing semicolon — `v_val := a` lacks the terminating `;` and is directly followed by `s_res <= v_val`, verifying that variable_assignment requires semicolon termination
-- Expected Result: Triggers syntax error: missing ";" after variable assignment
-- Dependencies: None
-- =============================================================
entity vas_snn4_ent is port(a:in integer; y:out integer); end entity;
architecture bh of vas_snn4_ent is signal s_res:integer:=0;
begin
  process(a)
    variable v_val:integer:=0;
  begin
    v_val := a
    s_res <= v_val;
  end process;
  y <= s_res;
end architecture bh;
