-- =============================================================
-- Case ID: TC_INTERFACE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_declaration ::= interface_object_declaration interface_type_declaration | interface_subprogram_declaration | interface_package_declaration
-- Case Type: Negative
-- Test Focus: interface_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_decla_e3 is end entity;
architecture bh of interface_decla_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;