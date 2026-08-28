-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_CVA_BRANCH_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Rule Description: Variable assignment target and conditional_expressions branches must have compatible types
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: branch types of the conditional variable assignment are incompatible with the target - in v := true when sel='1' else false the branches are boolean type, mismatching the integer type variable v
-- Expected Result: Triggers analysis error: can't match "true" with type integer
-- Dependencies: None
-- =============================================================
entity cva_branch_type is port(sel:in bit; y:out integer); end entity;
architecture vhdl2008 of cva_branch_type is
begin
  process(sel) is
    variable v:integer;
  begin
    v := true when sel='1' else false;
    y <= v;
  end process;
end architecture vhdl2008;
