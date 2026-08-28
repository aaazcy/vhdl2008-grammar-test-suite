-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: block_configuration of configuration_item references a nonexistent architecture body: the architecture body referenced by for fake_arch is not defined for the entity, verifying the architecture name must exist in the configured entity
-- Expected Result: Triggers semantic error on undefined architecture reference
-- Dependencies: None
-- =============================================================
entity ci_sem1_ent is
  port(a:in bit; y:out bit);
end entity;
architecture rtl of ci_sem1_ent is begin y<=a; end architecture;
configuration ci_sem1_cfg of ci_sem1_ent is
  for no_such_arch
  end for;
end configuration ci_sem1_cfg;
