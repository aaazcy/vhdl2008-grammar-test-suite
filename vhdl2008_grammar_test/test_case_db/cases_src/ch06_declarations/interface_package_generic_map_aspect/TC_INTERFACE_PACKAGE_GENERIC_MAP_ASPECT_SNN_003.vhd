-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_generic_map_aspect ::= generic_map_aspect generic map ( <> ) | generic map ( default )
-- Case Type: Negative
-- Test Focus: interface_package_generic_map_aspect: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity interface_packa_e3 is end entity;
architecture bh of interface_packa_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;