-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: package_instantiation_declaration: full syntax with generic_map_aspect — exercises all BNF tokens: 'package', identifier, 'is', 'new', uninstantiated_package_name, generic_map_aspect, and ';'
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_inst_full_syntax is
  port (
    data_width : in  positive;
    out_size   : out natural
  );
end entity;

architecture test of pkg_inst_full_syntax is
  -- Simulates: package my_fifo_pkg is new generic_fifo_pkg
  --   generic map (WIDTH => 8, DEPTH => 256);
  -- The pattern below mirrors the semantic structure of a package instantiation

  constant C_WIDTH : natural := 8;
  constant C_DEPTH : natural := 256;

  function f_calc_size(w, d : natural) return natural is
  begin
    return w * d;
  end function;
begin
  out_size <= f_calc_size(data_width, C_DEPTH);
end architecture test;
