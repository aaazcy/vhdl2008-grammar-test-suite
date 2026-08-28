-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Negative
-- Test Focus: package_declaration: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity package_declara_e3 is end entity;
architecture bh of package_declara_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;