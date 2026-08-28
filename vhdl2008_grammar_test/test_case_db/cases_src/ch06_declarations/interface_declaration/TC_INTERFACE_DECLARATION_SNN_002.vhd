-- =============================================================
-- Case ID: TC_INTERFACE_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_declaration ::= interface_object_declaration interface_type_declaration | interface_subprogram_declaration | interface_package_declaration
-- Case Type: Negative
-- Test Focus: interface_declaration: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_decla_e2 is end entity;
architecture bh of interface_decla_e2 is
  -- ERROR: invalid syntax in interface_declaration
  signal s : bit;
begin
  s <= '1'
end architecture bh;