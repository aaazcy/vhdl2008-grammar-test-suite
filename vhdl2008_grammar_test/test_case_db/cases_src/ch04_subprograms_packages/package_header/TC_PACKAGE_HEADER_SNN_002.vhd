-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Negative
-- Test Focus: package_header: generic_map_aspect without preceding generic_clause — the BNF requires generic_clause to be present if generic_map_aspect is used; a bare 'generic map (...)' without its enclosing generic clause is a syntax error
-- Expected Result: Triggers syntax error: '(' is expected instead of 'map'
-- Dependencies: None
-- =============================================================
package ph_gmap_pkg is
  generic map (G => 8);
end package ph_gmap_pkg;
