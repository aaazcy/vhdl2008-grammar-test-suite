-- =============================================================
-- Case ID: TC_EXTERNAL_PATHNAME_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_pathname ::= package_pathname | absolute_pathname | relative_pathname
-- Case Type: Negative
-- Test Focus: SNN: duplicated '@' symbol in an external_pathname of the package_pathname form — in <<constant @@work.pkg.MAX : integer>> the path begins with '@@'; package_pathname allows only a single '@' prefix, and the library logical name is missing at the second '@'
-- Expected Result: Triggers syntax error (library name expected after '@')
-- Dependencies: None
-- =============================================================
entity ext_path_double_at is
end entity;

architecture vhdl2008 of ext_path_double_at is
  alias bad_ref is <<constant @@work.pkg.MAX : integer>>;
begin
end architecture vhdl2008;
