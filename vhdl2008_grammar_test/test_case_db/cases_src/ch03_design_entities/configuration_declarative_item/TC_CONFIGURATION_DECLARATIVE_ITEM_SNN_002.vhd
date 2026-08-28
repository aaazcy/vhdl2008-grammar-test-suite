-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: configuration_declarative_item: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity configuration_d_e2 is end entity;
architecture bh of configuration_d_e2 is
  -- ERROR: invalid syntax in configuration_declarative_item
  signal s : bit;
begin
  s <= '1'
end architecture bh;