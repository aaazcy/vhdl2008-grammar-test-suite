-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EDI_003
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: the same identifier must not be declared twice in entity_declarative_item
-- Case Type: Negative
-- Error Category: duplicate_declaration_error
-- Test Focus: Negative example: the entity declarative part first declares type t_conf is range 0 to 15, then declares constant t_conf:integer:=5, the same identifier t_conf is declared as different types (first type then constant), triggering a duplicate declaration semantic conflict, verifying the analyzer detects duplicate identifier declarations in the entity-level declarative part
-- Expected Result: Triggers semantic error: duplicate declaration of identifier t_conf in entity declarative part
-- Dependencies: None
-- =============================================================
entity edi_smn1_ent is
  port(y:out integer);
  type t_conf is range 0 to 15;
  constant t_conf:integer:=5;
end entity edi_smn1_ent;
architecture bh of edi_smn1_ent is
begin y<=integer(t_conf); end architecture bh;
