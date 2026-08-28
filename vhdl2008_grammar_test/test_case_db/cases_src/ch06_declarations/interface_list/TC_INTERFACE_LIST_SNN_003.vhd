-- =============================================================
-- Case ID: TC_INTERFACE_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_list ::= interface_element { ; interface_element }
-- Case Type: Negative
-- Test Focus: interface_list: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_list_e3 is end entity;
architecture bh of interface_list_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;