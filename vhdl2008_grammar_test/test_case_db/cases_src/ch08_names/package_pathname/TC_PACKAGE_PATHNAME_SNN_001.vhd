-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Negative
-- Test Focus: SNN: library_logical_name missing after '@' in package_pathname — in <<constant @.pkg.MAX : integer>> the '@' is directly followed by '.' with no library logical name, violating the syntax requirement that package_pathname must start with '@' plus a library logical name
-- Expected Result: Triggers syntax error (library name expected after '@')
-- Dependencies: None
-- =============================================================
entity pkg_path_missing_lib is
end entity;

architecture vhdl2008 of pkg_path_missing_lib is
  alias bad_ref is <<constant @.pkg.MAX : integer>>;
begin
end architecture vhdl2008;
