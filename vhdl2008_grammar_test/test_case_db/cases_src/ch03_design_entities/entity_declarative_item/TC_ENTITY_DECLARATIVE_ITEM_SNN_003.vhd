-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= subprogram_declaration | subprogram_body subprogram_instantiation_declaration | package_declaration
-- Case Type: Negative
-- Test Focus: entity_declarative_item: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity entity_declarat_e3 is end entity;
architecture bh of entity_declarat_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;