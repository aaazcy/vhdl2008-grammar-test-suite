-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Case Type: Positive
-- Test Focus: Selected force inside a clocked process driven by rising_edge(clk) -- tests selected force in synchronous context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sel_force_syn_007 is
end entity sel_force_syn_007;

architecture test of sel_force_syn_007 is
  signal clk      : std_logic := '0';
  signal s_sel    : integer range 0 to 3 := 0;
  signal s_target : std_logic_vector(7 downto 0) := "00000000";
begin
  process is
  begin
    wait for 5 ns;
    clk <= not clk;
    if rising_edge(clk) then
      with s_sel select s_target <= force in
        "00000001" when 0,
        "00000010" when 1,
        "00000100" when 2,
        "00001000" when 3;
    end if;
    if now > 50 ns then
      s_target <= release in;
      wait;
    end if;
  end process;
end architecture test;
