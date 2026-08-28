-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Negative
-- Test Focus: entity_declarative_part: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity entity_declarat_e2 is end entity;
architecture bh of entity_declarat_e2 is
  -- ERROR: invalid syntax in entity_declarative_part
  signal s : bit;
begin
  s <= '1'
end architecture bh;