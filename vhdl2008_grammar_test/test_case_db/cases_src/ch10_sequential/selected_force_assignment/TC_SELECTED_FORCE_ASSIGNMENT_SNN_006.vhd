-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Case Type: Negative
-- Test Focus: Missing choices after a `when` keyword in selected expressions -- tests that bare `when` without any choice is rejected
-- Expected Result: Triggers syntax error: missing choice after 'when'
-- Dependencies: None
-- =============================================================
entity sel_force_snn_006 is
end entity sel_force_snn_006;

architecture test of sel_force_snn_006 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_sel select s_target <= force 10 when ;  -- ERROR: no choice after 'when'
    wait;
  end process;
end architecture test;
