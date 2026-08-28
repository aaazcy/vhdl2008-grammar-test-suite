-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SYN_001
-- Rule Type: Syntax
-- BNF Production: SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Positive
-- Test Focus: Signal list "all" alternative — exercises "disconnect all : bit after ..." to apply disconnect timing to all guarded signals of a type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sl_all_form is
  port(din : in std_logic_vector(1 downto 0); dout : out std_logic_vector(1 downto 0) bus);
end entity;

architecture bh of sl_all_form is
  signal s_g0, s_g1 : std_logic bus := '0';
  disconnect all : std_logic after 3 ns;
begin
  g_blk : block (din(0) = '1')
  begin
    s_g0 <= guarded din(0); s_g1 <= guarded din(1);
    dout(0) <= guarded s_g0; dout(1) <= guarded s_g1;
  end block;
end architecture bh;
