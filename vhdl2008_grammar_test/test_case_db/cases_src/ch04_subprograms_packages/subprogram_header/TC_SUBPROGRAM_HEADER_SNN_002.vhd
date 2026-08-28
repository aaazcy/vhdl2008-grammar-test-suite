-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ] [ parameter ] ( formal_parameter_list )
-- Case Type: Negative
-- Test Focus: subprogram_header: missing parentheses of the formal parameter list after the parameter keyword — in 'function f_bad parameter return integer;' nothing follows parameter with '(...)', verifies parameter must be followed by a formal parameter list
-- Expected Result: Triggers syntax error: 'parameter' must be followed by a list of parameters
-- Dependencies: None
-- =============================================================
package sh_paren_pkg is
  function f_bad parameter return integer;
end package sh_paren_pkg;
