-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: variable_assignment_statement ::= [ label : ] simple_variable_assignment | [ label : ] conditional_variable_assignment | [ label : ] selected_variable_assignment
-- Case Type: Positive
-- Test Focus: Conditional variable assignment form: VHDL 2008 conditional_variable_assignment, target is v_res, a when-else chain selects different expressions to assign based on comparing a with b, verifying the conditional branch of variable_assignment_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vas_cond_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of vas_cond_ent is signal s_res:integer:=0;
begin
  process(a,b)
    variable v_res:integer;
  begin
    v_res := 3 when a > b else
             2 when a < b else
             1;
    s_res <= v_res;
    y <= s_res;
  end process;
end architecture bh;
