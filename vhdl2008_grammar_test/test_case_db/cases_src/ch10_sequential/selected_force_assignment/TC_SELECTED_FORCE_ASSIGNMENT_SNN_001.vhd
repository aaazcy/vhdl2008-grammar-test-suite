-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Case Type: Negative
-- Test Focus: Missing the mandatory `with` keyword at the start of a selected force assignment -- select expression without leading with
-- Expected Result: Triggers syntax error: missing 'with' keyword
-- Dependencies: None
-- =============================================================
entity sel_force_snn_001 is
end entity sel_force_snn_001;

architecture test of sel_force_snn_001 is
  signal s_sel    : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    s_sel select s_target <= force 10 when others;  -- ERROR: missing 'with'
    wait;
  end process;
end architecture test;
