-- =============================================================
-- Case ID: TC_INTERFACE_SIGNAL_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_signal_declaration ::= [ signal ] identifier_list : [ mode ] subtype_indication [ bus ] [ := static_expression ]
-- Case Type: Positive
-- Test Focus: Exercises interface_signal_declaration with bus keyword on a guarded signal port in a tri-state bus controller.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
library ieee;
use ieee.std_logic_1164.all;

entity interface_signal_syn3 is
  port (
    oe      : in  bit;
    data_bus : inout std_logic_vector(7 downto 0) bus;
    tx_data  : in  std_logic_vector(7 downto 0);
    rx_data  : out std_logic_vector(7 downto 0)
  );
end entity interface_signal_syn3;

architecture rtl of interface_signal_syn3 is
begin
  b_tri : block (oe = '1')
  begin
    data_bus <= guarded tx_data;
  end block;
  rx_data <= data_bus;
end architecture rtl;
