-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_declaration ::= package identifier is new uninstantiated_package_name interface_package_generic_map_aspect
-- Case Type: Negative
-- Test Focus: interface_package_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_packa_e3 is end entity;
architecture bh of interface_packa_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;