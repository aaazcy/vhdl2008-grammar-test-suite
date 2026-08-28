-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= (15 alternatives)
-- Case Type: Negative
-- Test Focus: SNN: illegal declaration in the entity declarative part — variable declaration (without shared) is illegal at the entity level, allowed only inside process/subprogram, verifying entity_declarative_item does not include variable_declaration
-- Expected Result: Triggers syntax error: variable declaration not allowed in entity
-- Dependencies: None
-- =============================================================
entity edi_snn1_ent is port(clk:in bit); end entity;
architecture bh of edi_snn1_ent is
  variable v_bad:integer:=0;
begin end architecture bh;
