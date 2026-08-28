-- =============================================================
-- Case ID: TC_SUBPROGRAM_INSTANTIATION_DECLARATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: subprogram_instantiation_declaration ::= subprogram_kind identifier is new uninstantiated_subprogram_name [ signature ] [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: function instantiation with signature returning an array type: function f is new gen_func [return bit_vector], verifies a composite return type in the signature
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_vec_pkg is
  function f_not_vec generic(type t) parameter(x:t) return t;
end package;
package body gen_vec_pkg is
  function f_not_vec generic(type t) parameter(x:t) return t is begin return x; end function;
end package body;
entity sid_vec_ent is port(din:in bit_vector(3 downto 0); dout:out bit_vector(3 downto 0)); end entity;
architecture bh of sid_vec_ent is
  function f_bv_not is new work.gen_vec_pkg.f_not_vec generic map(t=>bit_vector(3 downto 0));
begin
  dout<=f_bv_not(din);
end architecture bh;
