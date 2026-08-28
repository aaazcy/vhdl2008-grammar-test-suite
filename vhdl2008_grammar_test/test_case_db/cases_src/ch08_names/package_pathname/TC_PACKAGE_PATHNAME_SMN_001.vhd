-- =============================================================
-- Case ID: TC_PACKAGE_PATHNAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_PACKAGE_PATHNAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: package_pathname ::= @ library_logical_name . { package_simple_name . } object_simple_name
-- Case Type: Negative
-- Rule Description: In an external name formed by package_pathname, the subtype_indication must reference a declared type
-- Error Category: Undeclared subtype in external name
-- Test Focus: SMN: in an external constant name formed by package_pathname, the subtype_indication references an undeclared type — in <<constant @work.pkg.MAX : t_undef_pkgobj>>, t_undef_pkgobj has no declaration, so the type cannot be resolved during analysis
-- Expected Result: Triggers analysis error (no declaration for t_undef_pkgobj)
-- Dependencies: None
-- =============================================================
entity pkg_path_undef_subtype is
end entity;

architecture vhdl2008 of pkg_path_undef_subtype is
  alias bad_ref is <<constant @work.pkg.MAX : t_undef_pkgobj>>;
begin
end architecture vhdl2008;
