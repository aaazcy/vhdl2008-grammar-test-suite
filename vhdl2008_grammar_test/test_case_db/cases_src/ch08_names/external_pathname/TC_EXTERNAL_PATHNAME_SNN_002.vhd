-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Negative
-- Test Focus: SNN: in an external_pathname of the package_pathname form, the library_logical_name is missing after '@' — in <<constant @ : integer>> there is no library name after '@'; package_pathname must begin with '@' plus a library logical name
-- Expected Result: Triggers syntax error (library name expected after '@')
-- Dependencies: None
-- =============================================================

entity ext_path_missing_lib is
end entity ext_path_missing_lib;

architecture vhdl2008 of ext_path_missing_lib is
  alias bad_path is <<constant @ : integer>>;
begin
end architecture vhdl2008;
