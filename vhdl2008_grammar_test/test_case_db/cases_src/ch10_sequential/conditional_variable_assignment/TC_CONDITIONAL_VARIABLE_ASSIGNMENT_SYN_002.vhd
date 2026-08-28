-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: conditional_variable_assignment ::= target := conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Multi-branch conditional variable assignment: target v_grade selects different grade string length values via a 4-level when-else chain, verifying the multi-condition expression chain of conditional_variable_assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cva_syn2_ent is port(score:in integer; y:out integer); end entity;
architecture bh of cva_syn2_ent is signal s_res:integer:=0;
begin
  process(score)
    variable v_grade:integer;
  begin
    v_grade := 4 when score >= 90 else
               3 when score >= 75 else
               2 when score >= 60 else
               1;
    s_res <= v_grade;
    y <= s_res;
  end process;
end architecture bh;
