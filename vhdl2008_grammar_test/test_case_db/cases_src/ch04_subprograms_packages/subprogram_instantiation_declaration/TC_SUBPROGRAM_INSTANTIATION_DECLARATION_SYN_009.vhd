-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: subprogram_instantiation_declaration ::= subprogram_kind identifier is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: procedure instantiation with multiple type generics: procedure p is new gen_proc generic map(a_t=>integer, b_t=>bit), verifies the association of multiple generics in the instantiation declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_multi_pkg is
  procedure p_convert generic(type in_t; type out_t) parameter(signal src:in in_t; signal dst:out out_t);
end package;
package body gen_multi_pkg is
  procedure p_convert generic(type in_t; type out_t) parameter(signal src:in in_t; signal dst:out out_t) is begin null; end procedure;
end package body;
entity sid_multi_ent is port(r:out integer); end entity;
architecture bh of sid_multi_ent is
  procedure p_cv is new work.gen_multi_pkg.p_convert generic map(in_t=>bit, out_t=>integer);
begin
  r<=0;
end architecture bh;
