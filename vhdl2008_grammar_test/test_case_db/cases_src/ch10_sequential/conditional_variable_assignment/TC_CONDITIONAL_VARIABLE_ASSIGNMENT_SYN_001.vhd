-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_variable_assignment ::= target := conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Minimal form of conditional variable assignment: target v_res selects an expression value via a 2-branch when-else, condition is a > b, verifying the minimal when-else syntax of VHDL 2008 conditional_variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cva_syn1_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of cva_syn1_ent is signal s_res:integer:=0;
begin
  process(a,b)
    variable v_res:integer;
  begin
    v_res := 100 when a > b else 0;
    s_res <= v_res;
    y <= s_res;
  end process;
end architecture bh;
