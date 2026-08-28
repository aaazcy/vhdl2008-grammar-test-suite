-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Negative
-- Test Focus: SNN: library name missing after @ — in @.pkg.VAL the @ is directly followed by a dot with no library_logical_name; the library name is a required element of package_pathname
-- Expected Result: Triggers syntax error at missing library name
-- Dependencies: None
-- =============================================================
entity pkg_path_miss_lib is
  port(d : in bit; q : out bit);
end entity;

architecture vhdl2008 of pkg_path_miss_lib is
  -- ERROR: '@' must be immediately followed by library_logical_name
  alias bad_ref is <<constant @.pkg.MAX : integer>>;
begin
  q <= d;
end architecture vhdl2008;
