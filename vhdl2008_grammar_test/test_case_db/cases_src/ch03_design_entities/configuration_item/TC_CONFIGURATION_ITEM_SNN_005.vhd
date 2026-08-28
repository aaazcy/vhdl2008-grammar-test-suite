-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: block_configuration of configuration_item wrongly uses end block instead of end for: the nested block is closed with end block rather than end for, verifying the strict syntax of the block configuration closing keyword
-- Expected Result: Triggers syntax error on 'end block' instead of 'end for'
-- Dependencies: None
-- =============================================================
entity inv is
  port (x:in bit; z:out bit);
end entity inv;

architecture rtl of inv is
begin
end architecture rtl;

entity ci_snn5_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ci_snn5_ent is
  component inv is port(x:in bit; z:out bit); end component;
  signal s:bit;
begin
  u_inv:inv port map(x=>a,z=>s); y<=s;
end architecture;
configuration ci_snn5_cfg of ci_snn5_ent is
  for rtl
    for u_inv:inv use entity work.inv(rtl);
    end block;
  end for;
end configuration ci_snn5_cfg;
