-- =============================================================
-- Case ID: TC_SEM_2008_008_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_2008_008
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: subprogram_instantiation_declaration ::= subprogram_kind designator is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Rule Description: Subprogram instantiation generic map must match the uninstantiated subprogram formal generics in name and type
-- Case Type: Negative
-- Error Category: interface_violation
-- Test Focus: generic_map_aspect provides an association for EXTRA, a name that is not among the formal generics SCALE and OFFSET of the uninstantiated subprogram g_scale, so the association cannot be resolved
-- Expected Result: Triggers semantic error: no declaration for "extra"
-- Dependencies: None
-- =============================================================
package sem8_pkg is
  function g_scale generic(constant SCALE : integer := 1; constant OFFSET : integer := 0) return integer;
  function f_scaled is new g_scale generic map (SCALE => 2, OFFSET => 3, EXTRA => 0);
end package sem8_pkg;
