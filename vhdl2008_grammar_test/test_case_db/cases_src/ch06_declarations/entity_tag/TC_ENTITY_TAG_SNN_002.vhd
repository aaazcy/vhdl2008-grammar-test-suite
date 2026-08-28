-- =============================================================
-- Case ID: TC_ENTITY_TAG_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_TAG
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Production: entity_tag ::= simple_name | character_literal | operator_symbol
-- Case Type: Negative
-- Test Focus: entity_tag: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity entity_tag_e2 is end entity;
architecture bh of entity_tag_e2 is
  -- ERROR: invalid syntax in entity_tag
  signal s : bit;
begin
  s <= '1'
end architecture bh;