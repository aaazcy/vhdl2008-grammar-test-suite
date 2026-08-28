-- =============================================================
-- Case ID: TC_SELECTED_SIGNAL_ASSIGNMENT_SEM_DRV_003_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_DRV_003
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Rule Description: Choices in selected signal assignment must cover all values of the selection expression
-- Case Type: Negative
-- Error Category: incomplete_choice_set
-- Test Focus: Counterexample: with-select covers only sel=0 and sel=1, but sel is integer range 0 to 3 with 4 values in total, the choices for sel=2 and sel=3 are missing, verifying that the analyzer detects that choices do not cover all values
-- Expected Result: Triggers semantic error: choices do not cover all values
-- Dependencies: None
-- =============================================================
entity ssa_sem1_ent is port(sel:in integer range 0 to 3; a,b:in integer; y:out integer); end entity;
architecture bh of ssa_sem1_ent is
  signal s_out:integer:=0;
begin
  process(sel,a,b) begin
    with sel select s_out <=
      a when 0,
      b when 1;
    y <= s_out;
  end process;
end architecture bh;
