-- =============================================================
-- Case ID: TC_SIGNAL_LIST_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: signal_list ::= signal_name { , signal_name } | others | all
-- Case Type: Positive
-- Test Focus: the "all" keyword applied to multiple guarded signals of the same type — the architecture declares four guarded signals of bit type, "disconnect all : bit after ..." uniformly sets the disconnect timing for all guarded signals of bit type, verifies the "all" alternative can match all guarded signals of the same type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity sl_all_bit_type is
  port(ena : in std_logic; din : in std_logic_vector(3 downto 0); dout : out std_logic_vector(3 downto 0) bus);
end entity;

architecture rtl of sl_all_bit_type is
  signal latch0, latch1, latch2, latch3 : std_logic bus := '0';
  disconnect all : std_logic after 2 ns;
begin
  g_blk : block (ena = '1')
  begin
    latch0 <= guarded din(0) when ena = '1' else latch0;
    latch1 <= guarded din(1) when ena = '1' else latch1;
    latch2 <= guarded din(2) when ena = '1' else latch2;
    latch3 <= guarded din(3) when ena = '1' else latch3;
    dout(0) <= guarded latch0; dout(1) <= guarded latch1;
    dout(2) <= guarded latch2; dout(3) <= guarded latch3;
  end block;
end architecture rtl;
