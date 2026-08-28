-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: subprogram_instantiation_declaration ::= subprogram_kind designator is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: subprogram_instantiation_declaration: missing 'new' keyword — the BNF requires 'new' between 'is' and uninstantiated_subprogram_name; 'function f_inst is g_x;' without 'new' cannot be parsed as an instantiation and the name g_x is rejected
-- Expected Result: Triggers syntax error: 'return' expected
-- Dependencies: None
-- =============================================================
package sid_nonew_pkg is
  function g_x generic(constant SCALE : integer := 1) return integer;
  function f_inst is g_x;
end package sid_nonew_pkg;
