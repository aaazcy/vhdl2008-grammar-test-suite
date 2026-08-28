-- =============================================================
-- Case ID: TC_INTERFACE_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_list ::= interface_element { ; interface_element }
-- Case Type: Negative
-- Test Focus: interface_list: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_list_e2 is end entity;
architecture bh of interface_list_e2 is
  -- ERROR: invalid syntax in interface_list
  signal s : bit;
begin
  s <= '1'
end architecture bh;