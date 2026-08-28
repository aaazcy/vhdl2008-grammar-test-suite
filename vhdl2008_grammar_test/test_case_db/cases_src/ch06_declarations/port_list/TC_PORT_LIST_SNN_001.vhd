-- =============================================================
-- Case ID: TC_PORT_LIST_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_list ::= port_interface_list
-- Case Type: Negative
-- Test Focus: ERROR: port_list has a missing semicolon separator between two interface declarations.
-- Expected Result: Triggers syntax error (missing separator)
-- Dependencies: None
-- =============================================================
entity port_list_snn1 is
  port (
    clk : in bit
    data : in bit_vector(7 downto 0)
  );
end entity port_list_snn1;

architecture arch of port_list_snn1 is
begin
end architecture arch;
