-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_variable_assignment ::= target := conditional_expressions ;
-- Case Type: Negative
-- Test Focus: SNN: missing `:=` - `v_res 100 when a>b else 0;` has no assignment symbol, verifying conditional_variable_assignment requires the `:=` operator
-- Expected Result: Triggers syntax error: missing ":=" in conditional variable assignment
-- Dependencies: None
-- =============================================================
entity cva_snn1_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of cva_snn1_ent is signal s_res:integer:=0;
begin
  process(a,b)
    variable v_res:integer;
  begin
    v_res 100 when a > b else 0;
    s_res <= v_res;
    y <= s_res;
  end process;
end architecture bh;
