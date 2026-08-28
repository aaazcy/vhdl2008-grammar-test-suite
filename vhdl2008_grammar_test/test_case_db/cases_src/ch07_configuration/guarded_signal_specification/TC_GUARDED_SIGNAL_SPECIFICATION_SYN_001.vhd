-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SYN_001
-- Rule Type: Syntax
-- BNF Production: GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Positive
-- Test Focus: Guarded signal specification with single guarded signal — exercises "signal_name : type_mark" in disconnect specification with a bus-kind signal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity gss_single is
  port(din : in std_logic; dout : out std_logic bus);
end entity;

architecture bh of gss_single is
  signal s_g : std_logic bus := '0';
  disconnect s_g : std_logic after 4 ns;
begin
  g_blk : block (din = '1')
  begin
    s_g <= guarded din;
    dout <= guarded s_g;
  end block;
end architecture bh;
