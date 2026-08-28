-- =============================================================
-- Case ID: TC_CONDITIONAL_VARIABLE_ASSIGNMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_CVA_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Rule Description: All expressions in conditional branches must have same base type
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: type mismatch - integer vs bit in conditional branches
-- Expected Result: Triggers semantic error: type mismatch in conditional expression
-- Dependencies: None
-- =============================================================
entity cva_sem1_ent is port(sel:in bit; a:in integer; y:out integer); end entity;
architecture bh of cva_sem1_ent is
begin
  process(sel,a) is
    variable v:integer;
  begin
    v := a when sel='1' else '1';
    y<=v;
  end process;
end architecture bh;
