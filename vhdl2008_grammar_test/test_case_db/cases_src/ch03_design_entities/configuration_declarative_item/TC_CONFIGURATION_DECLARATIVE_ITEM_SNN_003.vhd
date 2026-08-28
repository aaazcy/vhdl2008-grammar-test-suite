-- =============================================================
-- Case ID: TC_CONFIGURATION_DECLARATIVE_ITEM_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONFIGURATION_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.4.1
-- Production: configuration_declarative_item ::= use_clause attribute_specification | group_declaration
-- Case Type: Negative
-- Test Focus: configuration_declarative_item: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity configuration_d_e3 is end entity;
architecture bh of configuration_d_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;