-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Positive
-- Test Focus: Minimal configuration_item (block_configuration): the configuration declaration contains only one block_configuration (for arch_name...end for) with no nested items, verifying the syntactic form of block_configuration as the minimal configuration_item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ci_block_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ci_block_ent is begin y<=a; end architecture;
configuration ci_block_cfg of ci_block_ent is
  for rtl
  end for;
end configuration ci_block_cfg;
