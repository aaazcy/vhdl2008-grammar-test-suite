-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Negative
-- Test Focus: package_pathname: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity package_pathnam_e2 is end entity;
architecture bh of package_pathnam_e2 is
  -- ERROR: invalid syntax in package_pathname
  signal s : bit;
begin
  s <= '1'
end architecture bh;