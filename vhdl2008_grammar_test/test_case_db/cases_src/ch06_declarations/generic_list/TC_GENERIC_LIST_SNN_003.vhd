-- =============================================================
-- Case ID: TC_GENERIC_LIST_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_list ::= generic_interface_list
-- Case Type: Negative
-- Test Focus: generic_list: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity generic_list_e3 is end entity;
architecture bh of generic_list_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;