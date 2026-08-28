-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: subprogram_instantiation_declaration ::= subprogram_kind designator is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: subprogram_instantiation_declaration: malformed signature — the optional [ signature ] must be a bracketed list closed with ']' ; the signature '[natural return natural' is missing the closing bracket, so the instantiation cannot be parsed
-- Expected Result: Triggers syntax error: ']' is expected instead of ';'
-- Dependencies: None
-- =============================================================
package sid_sig_pkg is
  function g_nat generic(constant SCALE : natural := 1) return natural;
  function f_bad is new g_nat [natural return natural;
end package sid_sig_pkg;
