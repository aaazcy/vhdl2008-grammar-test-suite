-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: configuration_item: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity configuration_i_e2 is end entity;
architecture bh of configuration_i_e2 is
  -- ERROR: invalid syntax in configuration_item
  signal s : bit;
begin
  s <= '1'
end architecture bh;