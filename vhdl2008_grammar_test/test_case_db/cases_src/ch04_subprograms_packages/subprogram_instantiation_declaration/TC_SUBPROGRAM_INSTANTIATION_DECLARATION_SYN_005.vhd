-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: subprogram_instantiation_declaration ::= subprogram_kind identifier is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: procedure instantiation with generic_map_aspect: procedure p is new gen_proc generic map(t=>bit), verifies the use of generic_map_aspect in subprogram_instantiation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_proc_pkg is
  procedure p_xfer generic(type elem_t) parameter(signal src:in elem_t; signal dst:out elem_t);
end package;
package body gen_proc_pkg is
  procedure p_xfer generic(type elem_t) parameter(signal src:in elem_t; signal dst:out elem_t) is begin dst<=src; end procedure;
end package body;
entity sid_gmap_ent is port(a:in bit; y:out bit); end entity;
architecture bh of sid_gmap_ent is
  procedure p_bit_xfer is new work.gen_proc_pkg.p_xfer generic map(elem_t=>bit);
begin
  p_bit_xfer(a,y);
end architecture bh;
