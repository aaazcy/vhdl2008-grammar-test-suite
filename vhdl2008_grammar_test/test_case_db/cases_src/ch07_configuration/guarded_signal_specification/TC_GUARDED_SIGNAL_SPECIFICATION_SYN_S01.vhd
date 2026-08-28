-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Test Focus: Guarded signal specification production-specific: multiple guarded signals with "others" alternative, combining explicit guarded_signal_list with "others" for default disconnect timing
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity gss_prod_specific is
  port(din : in std_logic_vector(1 downto 0); dout : out std_logic_vector(1 downto 0) bus);
end entity;

architecture bh of gss_prod_specific is
  signal s_g0, s_g1 : std_logic bus := '0';
  disconnect s_g0 : std_logic after 2 ns;
  disconnect others : std_logic after 5 ns;
begin
  g_blk : block (din(0) = '1')
  begin
    s_g0 <= guarded din(0); s_g1 <= guarded din(1);
    dout(0) <= guarded s_g0; dout(1) <= guarded s_g1;
  end block;
end architecture bh;
