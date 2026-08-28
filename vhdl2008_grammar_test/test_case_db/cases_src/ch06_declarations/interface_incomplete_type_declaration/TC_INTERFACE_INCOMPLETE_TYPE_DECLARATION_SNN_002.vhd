-- =============================================================
-- Case ID: TC_INTERFACE_INCOMPLETE_TYPE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_INCOMPLETE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.5
-- Production: interface_incomplete_type_declaration ::= type identifier
-- Case Type: Negative
-- Test Focus: interface_incomplete_type_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_incom_e2 is end entity;
architecture bh of interface_incom_e2 is
  -- ERROR: invalid syntax in interface_incomplete_type_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;