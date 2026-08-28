-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_025
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Rule Description: Selected force assignment with matching select ? is valid in process
-- Case Type: Positive
-- Test Focus: Valid selected force with matching select ? using out mode on std_logic_vector -- tests force out matched-select form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_force_sem_002 is
end entity sel_force_sem_002;

architecture test of sel_force_sem_002 is
  signal s_sel    : std_logic_vector(1 downto 0) := "00";
  signal s_target : std_logic_vector(3 downto 0) := "0000";
begin
  process is
  begin
    with s_sel select ? s_target <= force out
      "1111" when "11",
      "0001" when "01",
      "0000" when others;
    wait for 10 ns;
    s_target <= release out;
    wait;
  end process;
end architecture test;
