-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Case Type: Positive
-- Test Focus: Selected force with std_logic select expression covering all 9 values using force in mode -- tests std_logic_1164 type in select
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_force_syn_005 is
end entity sel_force_syn_005;

architecture test of sel_force_syn_005 is
  signal s_sel    : std_logic := '0';
  signal s_target : std_logic := '0';
begin
  process is
  begin
    with s_sel select s_target <= force in
      '1' when '1' | 'H',
      '0' when '0' | 'L',
      'Z' when others;
    wait for 10 ns;
    s_target <= release in;
    wait;
  end process;
end architecture test;
