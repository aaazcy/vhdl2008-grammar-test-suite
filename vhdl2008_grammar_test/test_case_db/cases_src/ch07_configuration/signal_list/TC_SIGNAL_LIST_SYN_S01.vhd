-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Test Focus: Signal list production-specific: demonstrates all three alternatives — comma-separated signal_name list, "others", and "all" — in disconnect specification context
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sl_prod_specific is
  port(din : in std_logic_vector(2 downto 0); dout : out std_logic_vector(2 downto 0) bus);
end entity;

architecture bh of sl_prod_specific is
  signal s_g0, s_g1, s_g2 : std_logic bus := '0';
  disconnect s_g0 : std_logic after 1 ns;
  disconnect s_g1, s_g2 : std_logic after 4 ns;
  disconnect others : std_logic after 8 ns;
begin
  g_blk : block (din(0) = '1')
  begin
    s_g0 <= guarded din(0); s_g1 <= guarded din(1); s_g2 <= guarded din(2);
    dout(0) <= guarded s_g0; dout(1) <= guarded s_g1; dout(2) <= guarded s_g2;
  end block;
end architecture bh;
