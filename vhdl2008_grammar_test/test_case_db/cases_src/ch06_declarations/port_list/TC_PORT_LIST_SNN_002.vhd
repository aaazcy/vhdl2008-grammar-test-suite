-- =============================================================
-- Case ID: TC_PORT_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_list ::= port_interface_list
-- Case Type: Negative
-- Test Focus: port_list: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity port_list_e2 is end entity;
architecture bh of port_list_e2 is
  -- ERROR: invalid syntax in port_list
  signal s : bit;
begin
  s <= '1'
end architecture bh;