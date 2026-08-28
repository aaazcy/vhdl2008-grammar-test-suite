-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Case Type: Positive
-- Test Focus: Selected force with out mode and others choice covering all unlisted cases -- tests force out with when others as final alternative
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_force_syn_008 is
  port (
    o_result : out std_logic_vector(3 downto 0)
  );
end entity sel_force_syn_008;

architecture test of sel_force_syn_008 is
  signal s_opcode : std_logic_vector(2 downto 0) := "000";
begin
  process is
  begin
    with s_opcode select o_result <= force out
      "0001" when "001",
      "0010" when "010",
      "0100" when "100",
      "0000" when others;
    wait for 10 ns;
    o_result <= release out;
    wait;
  end process;
end architecture test;
