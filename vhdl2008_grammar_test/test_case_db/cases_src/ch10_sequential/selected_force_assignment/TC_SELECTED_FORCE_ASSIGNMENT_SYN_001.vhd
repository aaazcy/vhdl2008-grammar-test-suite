-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Case Type: Positive
-- Test Focus: Minimal selected force -- tests bare `with sig select target <= force expr when choice` without ? or force_mode
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_force_syn_001 is
end entity sel_force_syn_001;

architecture test of sel_force_syn_001 is
  signal s_select : integer := 0;
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_select select s_target <= force
      10 when 1,
      20 when others;
    wait for 10 ns;
    s_target <= release;
    wait;
  end process;
end architecture test;
