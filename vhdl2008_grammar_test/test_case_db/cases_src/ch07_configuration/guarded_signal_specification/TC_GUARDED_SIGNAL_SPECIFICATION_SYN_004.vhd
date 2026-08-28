-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Positive
-- Test Focus: guarded_signal_specification with "others" reserved word as the guarded_signal_list -- exercises the "others" alternative within disconnect specification to apply a single disconnect time expression to all remaining guarded signals of the given type_mark that have not been explicitly named in preceding disconnect specifications
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity gss_others_guard is
  port(
    din  : in  std_logic_vector(3 downto 0);
    dout : out std_logic_vector(3 downto 0) bus
  );
end entity;

architecture bh of gss_others_guard is
  signal bus_a, bus_b : std_logic bus := '0';
  signal bus_c, bus_d : std_logic bus := '0';
  -- Explicit disconnect for bus_a
  disconnect bus_a : std_logic after 1 ns;
  -- "others" covers bus_b, bus_c, bus_d (all remaining bit-bus signals)
  disconnect others : std_logic after 5 ns;
begin
  g_blk : block (din(0) = '1')
  begin
    bus_a <= guarded din(0); bus_b <= guarded din(1);
    bus_c <= guarded din(2); bus_d <= guarded din(3);
    dout(0) <= guarded bus_a; dout(1) <= guarded bus_b;
    dout(2) <= guarded bus_c; dout(3) <= guarded bus_d;
  end block;
end architecture bh;
