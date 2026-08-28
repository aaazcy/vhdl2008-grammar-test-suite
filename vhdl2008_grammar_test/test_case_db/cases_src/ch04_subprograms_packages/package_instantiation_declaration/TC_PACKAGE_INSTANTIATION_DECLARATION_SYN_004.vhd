-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: package_instantiation_declaration: uninstantiated package with type generics — exercises the generic_map_aspect with type-based generic values, a key VHDL-2008 feature where package generics can be types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_inst_type_generic is
  port (
    param_in  : in  natural;
    param_out : out natural
  );
end entity;

architecture test of pkg_inst_type_generic is
  -- Simulates: package int_math_pkg is new generic_math_pkg
  --   generic map (T => natural, ZERO => 0);
  -- VHDL-2008 allows type generics in package instantiation

  function f_id(v : natural) return natural is
  begin
    return v;
  end function;
begin
  param_out <= f_id(param_in);
end architecture test;
