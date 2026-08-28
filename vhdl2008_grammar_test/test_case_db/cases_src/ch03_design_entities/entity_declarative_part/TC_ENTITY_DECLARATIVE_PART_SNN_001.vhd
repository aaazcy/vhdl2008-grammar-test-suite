-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_part ::= { entity_declarative_item }
-- Case Type: Negative
-- Test Focus: SNN: non-entity_declarative_item in the entity declarative part — variable v_err:integer:=0 appears in the entity declarative part, variable_declaration is not one of the 22 alternatives of entity_declarative_item, verifying every item in { } must be a legal entity_declarative_item, otherwise parsing fails
-- Expected Result: Triggers syntax error: variable declaration not a valid entity_declarative_item
-- Dependencies: None
-- =============================================================
entity edp_snn1_ent is
  port(y:out integer);
  variable v_err:integer:=0;
end entity edp_snn1_ent;
architecture bh of edp_snn1_ent is
begin y<=v_err; end architecture bh;
