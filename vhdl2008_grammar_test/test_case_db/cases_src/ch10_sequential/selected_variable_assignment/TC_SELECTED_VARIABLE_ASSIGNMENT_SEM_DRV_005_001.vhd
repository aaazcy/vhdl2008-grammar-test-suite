-- =============================================================
-- Case ID: TC_SELECTED_VARIABLE_ASSIGNMENT_SEM_DRV_005_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_DRV_005
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Rule Description: Choices in selected variable assignment must cover all values of the selection expression
-- Case Type: Negative
-- Error Category: incomplete_choice_set
-- Test Focus: Counterexample: with-select covers only op=0 and op=1, but op is integer range 0 to 2 with 3 values in total, the choice for op=2 is missing, verifying that the analyzer detects that choices do not cover all values
-- Expected Result: Triggers semantic error: choices do not cover all values
-- Dependencies: None
-- =============================================================
entity sva_sem1_ent is port(op:in integer range 0 to 2; a,b:in integer; y:out integer); end entity;
architecture bh of sva_sem1_ent is signal s_res:integer:=0;
begin
  process(op,a,b)
    variable v_op:integer;
  begin
    with op select v_op :=
      a when 0,
      b when 1;
    s_res <= v_op;
    y <= s_res;
  end process;
end architecture bh;
