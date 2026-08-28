-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: variable_assignment_statement ::= [ label : ] simple_variable_assignment | [ label : ] conditional_variable_assignment | [ label : ] selected_variable_assignment
-- Case Type: Positive
-- Test Focus: Selected variable assignment form: VHDL 2008 selected_variable_assignment, target is v_mux, uses with-select to assign different input variables based on the sel signal, verifying the selected branch of variable_assignment_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vas_sel_ent is port(sel:in integer range 0 to 3; a,b,c,d:in integer; y:out integer); end entity;
architecture bh of vas_sel_ent is signal s_res:integer:=0;
begin
  process(sel,a,b,c,d)
    variable v_mux:integer;
  begin
    with sel select v_mux :=
      a when 0,
      b when 1,
      c when 2,
      d when 3;
    s_res <= v_mux;
    y <= s_res;
  end process;
end architecture bh;
