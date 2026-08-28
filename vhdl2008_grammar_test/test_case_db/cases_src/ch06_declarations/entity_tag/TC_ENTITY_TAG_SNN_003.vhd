-- =============================================================
-- Case ID: TC_ENTITY_TAG_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_TAG
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Production: entity_tag ::= simple_name | character_literal | operator_symbol
-- Case Type: Negative
-- Test Focus: entity_tag: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity entity_tag_e3 is end entity;
architecture bh of entity_tag_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;