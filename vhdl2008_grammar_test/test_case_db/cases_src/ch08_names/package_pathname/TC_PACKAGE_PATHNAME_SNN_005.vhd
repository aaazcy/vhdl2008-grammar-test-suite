-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Negative
-- Test Focus: SNN: dot missing between the package name and the object name — in @work.pkg MAX the package name and the object name are separated by a space instead of the '.' dot; all elements of package_pathname must be connected by dots
-- Expected Result: Triggers syntax error at missing dot separator
-- Dependencies: None
-- =============================================================
entity pkg_path_miss_dot is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of pkg_path_miss_dot is
  -- ERROR: Missing '.' between package name and object name
  alias bad_ref is <<constant @work.pkg MAX : integer>>;
begin
  q <= d;
end architecture vhdl2008;
