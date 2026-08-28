-- =============================================================
-- Case ID: TC_SEM_2008_007_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_2008_007
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Rule Description: Package instantiation generic map must match the uninstantiated package formal generics in name and type
-- Case Type: Negative
-- Error Category: interface_violation
-- Test Focus: generic_map_aspect has wrong type for generic USE_ECC — the formal generic USE_ECC of sem7_tpl_pkg is boolean, but the association passes the integer literal 42, a type mismatch in the generic map
-- Expected Result: Triggers semantic error: can't associate integer literal with constant interface "USE_ECC"
-- Dependencies: None
-- =============================================================
package sem7_tpl_pkg is
  generic (USE_ECC : boolean := true);
  constant C_ECC : boolean := USE_ECC;
end package sem7_tpl_pkg;
package sem7_fifo_pkg is new work.sem7_tpl_pkg generic map (USE_ECC => 42);
