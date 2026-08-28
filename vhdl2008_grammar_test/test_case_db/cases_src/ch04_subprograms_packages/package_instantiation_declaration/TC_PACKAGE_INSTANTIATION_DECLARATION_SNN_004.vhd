-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Negative
-- Test Focus: package_instantiation_declaration: missing terminating semicolon — the BNF ends with ';' which is mandatory; omitting it makes the construct incomplete
-- Expected Result: Triggers syntax error: missing ";" at end of package instantiation
-- Dependencies: None
-- =============================================================
package pid_tpl3_pkg is
  generic (W : natural := 8);
  constant C : natural := W;
end package pid_tpl3_pkg;
package pid_nosemi_pkg is new work.pid_tpl3_pkg
