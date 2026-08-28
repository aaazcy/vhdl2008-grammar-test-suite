-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: Architecture name mismatch in block_configuration of configuration_item: the architecture name referenced by for wrong_arch does not exist in the configured entity, verifying correctness of the architecture name reference
-- Expected Result: Triggers syntax error on mismatched architecture name
-- Dependencies: None
-- =============================================================
entity ci_snn6_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ci_snn6_ent is begin y<=a; end architecture;
configuration ci_snn6_cfg of ci_snn6_ent is
  for wrong_name
  end for;
end configuration ci_snn6_cfg;
