-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Force in a clocked process driven by rising_edge -- tests force assignment in synchronous sequential context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity force_asgn_syn_006 is
end entity force_asgn_syn_006;

architecture test of force_asgn_syn_006 is
  signal clk   : std_logic := '0';
  signal s_data : std_logic_vector(7 downto 0) := "00000000";
begin
  process is
  begin
    wait for 5 ns;
    clk <= not clk;
    if rising_edge(clk) then
      s_data <= force in "10101010";
    end if;
    if now > 40 ns then
      s_data <= release in;
      wait;
    end if;
  end process;
end architecture test;
