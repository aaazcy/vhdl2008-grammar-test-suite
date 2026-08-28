-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_variable_assignment ::= target := conditional_expressions ;
-- Case Type: Negative
-- Test Focus: SNN: condition expression missing after when - in v_res := 100 when ; there is no condition on the right of when, when branches of conditional_expressions must carry a condition
-- Expected Result: Triggers syntax error: primary expression expected
-- Dependencies: None
-- =============================================================
entity cva_missing_cond is port(a,b:in integer; y:out integer); end entity;
architecture vhdl2008 of cva_missing_cond is
begin
  process(a,b)
    variable v_res:integer;
  begin
    v_res := 100 when;
    y <= v_res;
  end process;
end architecture vhdl2008;
