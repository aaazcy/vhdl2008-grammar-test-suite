-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Positive
-- Test Focus: three comma-separated signal names — tests the pattern of {signal_name , signal_name} repeated twice in signal_list, three guarded signals use a unified disconnect timing, verifies the comma-separated signal_name list can contain any number of elements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sl_triple_name is
  port(d0, d1, d2 : in std_logic; q0, q1, q2 : out std_logic bus);
end entity;

architecture rtl of sl_triple_name is
  signal g0, g1, g2 : std_logic bus := '0';
  disconnect g0, g1, g2 : std_logic after 5 ns;
begin
  g_blk : block (d0 = '1')
  begin
    g0 <= guarded d0; g1 <= guarded d1; g2 <= guarded d2;
    q0 <= guarded g0; q1 <= guarded g1; q2 <= guarded g2;
  end block;
end architecture rtl;
