-- =============================================================
-- Case ID: TC_COMPONENT_INSTANTIATION_STATEMENT_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPONENT_INSTANTIATION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.7.1
-- Production: component_instantiation_statement ::= instantiation_label : instantiated_unit [ generic_map_aspect ] [ port_map_aspect ] ;
-- Case Type: Positive
-- Test Focus: multiple instances with different generic values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ci_spc3_ent is
  port(a,b: in bit_vector(7 downto 0); y: out bit_vector(7 downto 0));
end entity;
architecture bh of ci_spc3_ent is
  component adder is
    generic(W : integer := 8);
    port(x,y: in bit_vector(W-1 downto 0); z: out bit_vector(W-1 downto 0));
  end component;
  signal s_tmp : bit_vector(7 downto 0);
begin
  u_add8 : adder generic map(W=>8) port map(x=>a, y=>b, z=>y);
end architecture bh;
