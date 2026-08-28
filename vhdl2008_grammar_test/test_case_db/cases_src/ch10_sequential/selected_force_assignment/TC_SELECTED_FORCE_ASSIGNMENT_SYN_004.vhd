-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Case Type: Positive
-- Test Focus: Selected force with enumerated type select expression and three named choices -- tests user-defined enum driving force selection
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_force_syn_004 is
end entity sel_force_syn_004;

architecture test of sel_force_syn_004 is
  type t_color is (RED, GREEN, BLUE);
  signal s_color  : t_color := RED;
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_color select s_target <= force
      1 when RED,
      2 when GREEN,
      3 when BLUE;
    wait for 10 ns;
    s_target <= release;
    wait;
  end process;
end architecture test;
