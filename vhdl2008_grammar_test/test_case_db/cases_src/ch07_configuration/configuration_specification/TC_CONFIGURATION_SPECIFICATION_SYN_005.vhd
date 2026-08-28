-- =============================================================
-- Case ID: TC_CONFIGURATION_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: configuration_specification ::= simple_configuration_specification | compound_configuration_specification
-- Case Type: Positive
-- Test Focus: Simple configuration_specification with generic_map_aspect but no port_map_aspect — exercises the simple_configuration_specification alternative where binding_indication includes entity_aspect and generic_map_aspect but omits port_map_aspect, showing that these clauses are optional in the simple form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff_reg is
  generic (W : integer := 1; INIT : bit := '0');
  port (clk : in bit; d : in bit; q : out bit);
end entity dff_reg;

architecture rtl of dff_reg is
begin
end architecture rtl;

entity confspec_simple_generic is
  port(clk,d : in bit; q : out bit);
end entity;

architecture bh of confspec_simple_generic is
  component dff_reg is
    generic(W : integer := 1; INIT : bit := '0');
    port(clk : in bit; d : in bit; q : out bit);
  end component;
  for u_dff : dff_reg use entity work.dff_reg(rtl)
    generic map(W => 1, INIT => '1');
  end for;
begin
  u_dff : dff_reg port map(clk=>clk, d=>d, q=>q);
end architecture bh;
