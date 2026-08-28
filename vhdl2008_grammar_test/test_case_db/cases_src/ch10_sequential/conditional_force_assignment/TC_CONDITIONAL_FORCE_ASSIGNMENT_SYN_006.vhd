-- =============================================================
-- Case ID: TC_CONDITIONAL_FORCE_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Conditional force with in mode inside a clocked process -- tests sequential context with sensitivity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity cond_force_syn_006 is
end entity cond_force_syn_006;

architecture test of cond_force_syn_006 is
  signal s_clk   : std_logic := '0';
  signal s_data  : std_logic := '0';
  signal s_enable : std_logic := '1';
begin
  s_clk <= not s_clk after 5 ns;

  process(s_clk) is
  begin
    if rising_edge(s_clk) then
      s_data <= force in '1' when s_enable = '1' else '0';
    end if;
  end process;
end architecture test;
