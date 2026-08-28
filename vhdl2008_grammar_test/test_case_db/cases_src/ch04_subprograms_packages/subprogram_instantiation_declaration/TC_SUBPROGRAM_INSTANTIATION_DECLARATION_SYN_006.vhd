-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: subprogram_instantiation_declaration ::= subprogram_kind identifier is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: full form of function instantiation with signature + generic_map_aspect: function f is new gen_func [return integer] generic map(t=>integer), verifies the full subprogram_instantiation_declaration with all optional tokens present
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_math_pkg is
  function f_abs generic(type val_t) parameter(x:val_t) return val_t;
end package;
package body gen_math_pkg is
  function f_abs generic(type val_t) parameter(x:val_t) return val_t is begin return x; end function;
end package body;
entity sid_full_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sid_full_ent is
  function f_int_abs is new work.gen_math_pkg.f_abs generic map(val_t=>integer);
begin
  y<=f_int_abs(a);
end architecture bh;
