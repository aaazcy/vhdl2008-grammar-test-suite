-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: package_header: generic_clause uses a reserved word as interface identifier — 'body' is a reserved word and cannot be used as the identifier of a generic interface declaration
-- Expected Result: Triggers syntax error: interface declaration expected
-- Dependencies: None
-- =============================================================
package ph_resv_pkg is
  generic (body : natural := 8);
end package ph_resv_pkg;
