-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= ... | use_clause | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: use_clause as entity_declarative_item — the entity declarative part contains use std.standard.all, verifying use_clause is a legal declaration item of the entity declarative part, making imported names visible in the entity-level scope
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_use_ent is
  port(val:in integer; doubled:out integer);
  use std.standard.all;
end entity edi_use_ent;
architecture bh of edi_use_ent is
begin
  doubled<=val*2;
end architecture bh;
