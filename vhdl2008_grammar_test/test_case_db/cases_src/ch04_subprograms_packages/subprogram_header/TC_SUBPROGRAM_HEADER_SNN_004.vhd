-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ] [ parameter ] ( formal_parameter_list )
-- Case Type: Negative
-- Test Focus: subprogram_header: extra semicolon inside parameter list — parameters in formal_parameter_list are separated by semicolons, but a trailing semicolon after the last parameter (before the closing paren) is syntactically invalid
-- Expected Result: Triggers syntax error: extra ';' at end of interface list
-- Dependencies: None
-- =============================================================
package sh_trail_pkg is
  function f_bad(a, b : integer;) return integer;
end package sh_trail_pkg;
