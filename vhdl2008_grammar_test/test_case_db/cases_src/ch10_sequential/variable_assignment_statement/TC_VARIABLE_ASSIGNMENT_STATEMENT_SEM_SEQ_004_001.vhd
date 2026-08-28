-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SEM_SEQ_004_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_004
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Rule Description: Expression type in variable assignment must match the variable type
-- Case Type: Negative
-- Error Category: type_mismatch
-- Test Focus: Counterexample: target v_val is an integer variable, the expression is a bit_vector literal `X"AB"`, the types are incompatible, verifying the analyzer detects that the := right-side expression type does not match the variable type
-- Expected Result: Triggers semantic error: type mismatch in variable assignment
-- Dependencies: None
-- =============================================================
entity vas_sem4_ent is port(a:in integer; y:out integer); end entity;
architecture bh of vas_sem4_ent is signal s_res:integer:=0;
begin
  process(a)
    variable v_val:integer:=0;
  begin
    v_val := X"AB";  -- ERROR: integer variable cannot accept bit_vector literal
    s_res <= a;
  end process;
  y <= s_res;
end architecture bh;
