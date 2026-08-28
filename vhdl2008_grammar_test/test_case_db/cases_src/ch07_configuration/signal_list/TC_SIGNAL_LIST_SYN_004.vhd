-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Positive
-- Test Focus: single signal name — tests the simplest form of signal_list, containing only one signal_name without comma separators, verifies a single signal name not joined by commas can be parsed correctly in a disconnect specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sl_single_name is
  port(din : in std_logic; dout : out std_logic bus);
end entity;

architecture rtl of sl_single_name is
  signal s_reg : std_logic bus := '0';
  disconnect s_reg : std_logic after 2 ns;
begin
  g_blk : block (din = '1')
  begin
    s_reg <= guarded din;
    dout <= guarded s_reg;
  end block;
end architecture rtl;
