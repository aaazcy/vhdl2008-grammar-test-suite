-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: block_configuration of configuration_item missing the for keyword: arch_name is written directly without the for prefix, verifying the mandatory for keyword of block_configuration
-- Expected Result: Triggers syntax error on missing 'for' keyword in block_configuration
-- Dependencies: None
-- =============================================================
entity ci_snn1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ci_snn1_ent is begin y<=a; end architecture;
configuration ci_snn1_cfg of ci_snn1_ent is
  rtl
  end for;
end configuration ci_snn1_cfg;
