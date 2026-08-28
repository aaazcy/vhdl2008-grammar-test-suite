-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: package_instantiation_declaration: generic_map_aspect references a non-existent generic — the association name BOGUS does not match any formal generic of the uninstantiated package pid_tpl2_pkg, so the association cannot be resolved
-- Expected Result: Triggers semantic error: no declaration for "bogus"
-- Dependencies: None
-- =============================================================
package pid_tpl2_pkg is
  generic (WIDTH : natural := 8);
  constant C : natural := WIDTH;
end package pid_tpl2_pkg;
package pid_badmap_pkg is new work.pid_tpl2_pkg generic map (BOGUS => 8);
