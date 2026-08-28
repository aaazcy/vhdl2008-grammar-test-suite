-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: subprogram_instantiation_declaration ::= subprogram_kind identifier is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: function instantiation with signature and without generic_map_aspect: function f is new gen_func [integer return integer], verifies the square-bracket syntax of signature
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_pkg_func is
  generic(type a_t; type r_t);
  function f_op(x:a_t) return r_t;
end package;
package body gen_pkg_func is
  function f_op(x:a_t) return r_t is begin return r_t(x); end function;
end package body;
entity sid_func_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sid_func_ent is
  function f_conv is new gen_pkg_func.f_op generic map(a_t=>integer, r_t=>integer);
begin
  y<=f_conv(a);
end architecture bh;
