-- =============================================================
-- Case ID: TC_GENERIC_LIST_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_list ::= generic_interface_list
-- Case Type: Negative
-- Test Focus: generic_list: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generic_list_e2 is end entity;
architecture bh of generic_list_e2 is
  -- ERROR: invalid syntax in generic_list
  signal s : bit;
begin
  s <= '1'
end architecture bh;