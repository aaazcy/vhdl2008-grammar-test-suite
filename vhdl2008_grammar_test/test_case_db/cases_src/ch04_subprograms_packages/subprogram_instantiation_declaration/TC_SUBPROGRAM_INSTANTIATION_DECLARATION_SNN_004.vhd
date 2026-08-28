-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: subprogram_instantiation_declaration ::= subprogram_kind designator is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: subprogram_instantiation_declaration: unknown uninstantiated_subprogram_name — the referenced name nonexistent_template does not refer to any declared uninstantiated subprogram, so the instantiation cannot be elaborated
-- Expected Result: Triggers semantic error: no declaration for "nonexistent_template"
-- Dependencies: None
-- =============================================================
package sid_ghost_pkg is
  function f_bad is new nonexistent_template;
end package sid_ghost_pkg;
