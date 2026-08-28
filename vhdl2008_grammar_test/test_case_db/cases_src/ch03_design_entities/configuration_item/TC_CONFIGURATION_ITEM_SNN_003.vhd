-- =============================================================
-- Case ID: TC_CONFIGURATION_ITEM_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.2
-- Production: configuration_item ::= block_configuration | component_configuration
-- Case Type: Negative
-- Test Focus: configuration_item: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity configuration_i_e3 is end entity;
architecture bh of configuration_i_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;