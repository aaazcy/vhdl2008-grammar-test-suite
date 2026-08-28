-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Positive
-- Test Focus: configuration_item containing only component_configuration: block_configuration contains a single component_configuration (for inst:comp use entity...), verifying the correct syntax of component_configuration as a configuration item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity nand2 is
  port (x1,x2:in bit; z:out bit);
end entity nand2;

architecture rtl of nand2 is
begin
end architecture rtl;

entity ci_comp_ent is
  port(a,b:in bit; y:out bit);
end entity;
architecture rtl of ci_comp_ent is
  component nand2 is port(x1,x2:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_nand:nand2 port map(x1=>a,x2=>b,z=>s); y<=s;
end architecture;
configuration ci_comp_cfg of ci_comp_ent is
  for rtl
    for u_nand:nand2 use entity work.nand2(rtl);
    end for;
  end for;
end configuration ci_comp_cfg;
