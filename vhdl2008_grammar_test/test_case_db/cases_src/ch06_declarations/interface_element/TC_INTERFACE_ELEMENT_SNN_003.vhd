-- =============================================================
-- Case ID: TC_INTERFACE_ELEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_element ::= interface_declaration
-- Case Type: Negative
-- Test Focus: interface_element: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_eleme_e3 is end entity;
architecture bh of interface_eleme_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;