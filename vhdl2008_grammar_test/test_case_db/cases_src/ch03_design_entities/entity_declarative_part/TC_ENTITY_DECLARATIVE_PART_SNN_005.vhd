-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: incomplete entity_declarative_item type declaration syntax — type t_data is lacks a type definition (range/enum/record etc.) and is directly followed by a semicolon, verifying type_declaration as an entity_declarative_item must satisfy the complete BNF type_definition
-- Expected Result: Triggers syntax error: incomplete type declaration
-- Dependencies: None
-- =============================================================
entity edp_snn5_ent is
  port(y:out bit);
  type t_data is;
end entity edp_snn5_ent;
architecture bh of edp_snn5_ent is
begin y<='0'; end architecture bh;
