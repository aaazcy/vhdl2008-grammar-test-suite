-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.4
-- Production: configuration_declaration ::= configuration identifier of entity_name is configuration_declarative_part block_configuration end [ configuration ] [ configuration_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Binding indication with port map: the entity_aspect of the for...use clause in block_configuration uses port map to explicitly map component ports, verifying configuration binding supports the port map syntax for establishing signal connections
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dff is
  port (clock,clear:in bit; data_out:out bit);
end entity dff;

architecture rtl of dff is
begin
end architecture rtl;

entity cfg_portmap_ent is
  port(clk,reset:in bit; q:out bit);
end entity;
architecture rtl of cfg_portmap_ent is
  component dff is
    port(clock,clear:in bit; data_out:out bit);
  end component;
  signal clk_int,rst_int,q_int:bit;
begin
  u_dff:dff port map(clock=>clk_int,clear=>rst_int,data_out=>q_int);
  clk_int<=clk; rst_int<=reset; q<=q_int;
end architecture;
configuration cfg_portmap of cfg_portmap_ent is
  for rtl
    for u_dff:dff use entity work.dff(rtl)
      port map(clock=>clk,clear=>reset,data_out=>q);
    end for;
  end for;
end configuration cfg_portmap;
