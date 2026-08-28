-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Positive
-- Test Focus: the "others" alternative combined with preceding explicit disconnects — in an architecture with multiple guarded signals, explicit disconnect timing is first specified for two signals, then the "others" keyword sets the default disconnect timing for the remaining unspecified guarded signals, verifies the syntax correctness when "others" as a catch-all alternative coexists with an explicit list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sl_others_catchall is
  port(din : in std_logic_vector(3 downto 0); dout : out std_logic_vector(3 downto 0) bus);
end entity;

architecture rtl of sl_others_catchall is
  signal g0, g1, g2, g3 : std_logic bus := '0';
  disconnect g0 : std_logic after 1 ns;
  disconnect g1 : std_logic after 3 ns;
  disconnect others : std_logic after 6 ns;
begin
  g_blk : block (din(0) = '1')
  begin
    g0 <= guarded din(0); g1 <= guarded din(1); g2 <= guarded din(2); g3 <= guarded din(3);
    dout(0) <= guarded g0; dout(1) <= guarded g1; dout(2) <= guarded g2; dout(3) <= guarded g3;
  end block;
end architecture rtl;
