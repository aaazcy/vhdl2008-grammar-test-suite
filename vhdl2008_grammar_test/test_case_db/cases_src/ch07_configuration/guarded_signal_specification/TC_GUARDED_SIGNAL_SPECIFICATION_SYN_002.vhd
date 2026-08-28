-- =============================================================
-- Case ID: TC_GUARDED_SIGNAL_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GUARDED_SIGNAL_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: guarded_signal_specification ::= guarded_signal_list : type_mark
-- Case Type: Positive
-- Test Focus: guarded_signal_specification used in disconnection_specification — disconnect guarded_signal after time_expression; the guarded_signal_list is a comma-separated list of guarded signal names followed by : type_mark
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity gss_disconnect_ent is
  port(bus_in : in std_logic_vector(3 downto 0); bus_out : out std_logic_vector(3 downto 0) bus);
end entity;

architecture bh of gss_disconnect_ent is
  signal internal_bus : std_logic_vector(3 downto 0) bus := "0000";
  disconnect internal_bus : std_logic_vector after 5 ns;
begin
  g_blk : block (bus_in(0) = '1')
  begin
    internal_bus <= guarded bus_in;
    bus_out <= guarded internal_bus;
  end block;
end architecture bh;
