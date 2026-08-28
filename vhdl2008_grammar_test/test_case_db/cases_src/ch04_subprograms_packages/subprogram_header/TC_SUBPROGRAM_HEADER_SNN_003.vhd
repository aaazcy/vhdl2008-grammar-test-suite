-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ] [ parameter ] ( formal_parameter_list )
-- Case Type: Negative
-- Test Focus: subprogram_header: generic_map_aspect present but generic_clause missing — the BNF nests: [ generic_clause [ generic_map_aspect ; ] ], meaning generic_map_aspect requires generic_clause; using 'generic map (...)' alone without a preceding generic clause is a syntax error
-- Expected Result: Triggers syntax error: '(' is expected instead of 'map'
-- Dependencies: None
-- =============================================================
package sh_gmap_pkg is
  function f_gmap generic map (t => integer) return integer;
end package sh_gmap_pkg;
