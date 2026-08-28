-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: package_instantiation_declaration: missing 'new' keyword — the BNF requires the 'new' keyword between 'is' and the uninstantiated_package_name; omitting 'new' leaves a bare package name where the parser expects a declarative item
-- Expected Result: Triggers syntax error: object class keyword such as 'variable' is expected
-- Dependencies: None
-- =============================================================
package pid_tpl_pkg is
  generic (W : natural := 8);
  constant C : natural := W;
end package pid_tpl_pkg;
package pid_bad_inst is pid_tpl_pkg;
