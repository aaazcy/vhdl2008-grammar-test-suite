-- =============================================================
-- Case ID: TC_PACKAGE_INSTANTIATION_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_INSTANTIATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.6
-- Production: package_instantiation_declaration ::= package identifier is new uninstantiated_package_name [ generic_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: package_instantiation_declaration: multiple instantiations of same uninstantiated package with different generic maps — exercises that the same uninstantiated package can be instantiated multiple times as different named packages with different generic parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_inst_multi is
  port (
    sel   : in  natural range 0 to 1;
    a_in  : in  bit_vector(3 downto 0);
    b_in  : in  bit_vector(7 downto 0);
    d_out : out natural
  );
end entity;

architecture test of pkg_inst_multi is
  -- Simulates multiple package instantiations from the same template:
  -- package pkg_narrow is new generic_vector_pkg generic map (W => 4);
  -- package pkg_wide is new generic_vector_pkg generic map (W => 8);

  constant C_WIDTH_A : natural := 4;
  constant C_WIDTH_B : natural := 8;

  function f_len(v : bit_vector) return natural is
  begin
    return v'length;
  end function;
begin
  d_out <= f_len(a_in) when sel = 0 else f_len(b_in);
end architecture test;
