-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Negative
-- Test Focus: entity_declarative_part: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity entity_declarat_e3 is end entity;
architecture bh of entity_declarat_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;