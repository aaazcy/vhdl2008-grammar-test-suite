-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: subprogram_instantiation_declaration ::= subprogram_kind identifier is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: minimal form: procedure instantiation without signature and without generic_map_aspect — procedure p is new gen_proc, verifies the subprogram_instantiation_declaration with only the required tokens
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_pkg_proc is
  procedure p_swap generic(type t) parameter(signal a,b:inout t);
end package;
package body gen_pkg_proc is
  procedure p_swap generic(type t) parameter(signal a,b:inout t) is
    variable tmp:t;
  begin tmp:=a; a<=b; b<=tmp; end procedure;
end package body;
entity sid_min_ent is port(a,b:inout integer); end entity;
architecture bh of sid_min_ent is
  procedure p_swap_int is new work.gen_pkg_proc.p_swap generic map(t=>integer);
begin
  p_swap_int(a,b);
end architecture bh;
