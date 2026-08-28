-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Negative
-- Test Focus: package_pathname: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity package_pathnam_e3 is end entity;
architecture bh of package_pathnam_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;