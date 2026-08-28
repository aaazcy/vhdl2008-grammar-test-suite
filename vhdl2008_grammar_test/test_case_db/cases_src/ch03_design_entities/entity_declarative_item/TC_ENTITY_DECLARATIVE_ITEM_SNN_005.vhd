-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= ... | constant_declaration | ... (22 alternatives)
-- Case Type: Negative
-- Test Focus: SNN: constant_declaration missing assignment expression — constant C_BAD:integer in the entity declarative part declares a type but lacks := value initialization, constant_declaration requires an assignment expression, verifying the missing := causes the parser to fail at entity_declarative_item
-- Expected Result: Triggers syntax error: constant declaration requires initialization expression
-- Dependencies: None
-- =============================================================
entity edi_snn5_ent is
  port(val:in integer);
  constant C_BAD:integer;
end entity edi_snn5_ent;
architecture bh of edi_snn5_ent is
begin end architecture bh;
