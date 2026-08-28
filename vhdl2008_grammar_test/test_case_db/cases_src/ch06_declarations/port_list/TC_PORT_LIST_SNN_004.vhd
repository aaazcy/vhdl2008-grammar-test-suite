-- =============================================================
-- Case ID: TC_PORT_LIST_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_list ::= port_interface_list
-- Case Type: Negative
-- Test Focus: ERROR: port_list with extra trailing semicolon before the closing parenthesis.
-- Expected Result: Triggers syntax error (extra separator)
-- Dependencies: None
-- =============================================================
entity port_list_snn4 is
  port (
    clk : in bit;
    data : in bit;
  );
end entity port_list_snn4;

architecture arch of port_list_snn4 is
begin
end architecture arch;
