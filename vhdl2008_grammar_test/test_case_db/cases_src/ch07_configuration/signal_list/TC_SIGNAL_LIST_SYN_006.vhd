-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Positive
-- Test Focus: five comma-separated signal names — tests the extended form of {signal_name , signal_name} repeated multiple times in signal_list, lists all five guarded signals in the disconnect context of a multi-bit register, verifies the comma-separated list can be extended to five elements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sl_quintuple_name is
  port(clk : in std_logic; d : in std_logic_vector(4 downto 0); q : out std_logic_vector(4 downto 0) bus);
end entity;

architecture rtl of sl_quintuple_name is
  signal r0, r1, r2, r3, r4 : std_logic bus := '0';
  disconnect r0, r1, r2, r3, r4 : std_logic after 4 ns;
begin
  g_blk : block (clk = '1')
  begin
    r0 <= guarded d(0); r1 <= guarded d(1); r2 <= guarded d(2); r3 <= guarded d(3); r4 <= guarded d(4);
    q(0) <= guarded r0; q(1) <= guarded r1; q(2) <= guarded r2; q(3) <= guarded r3; q(4) <= guarded r4;
  end block;
end architecture rtl;
