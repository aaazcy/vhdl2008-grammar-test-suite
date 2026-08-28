-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_PART_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_EDP_004
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: the same identifier in entity_declarative_part must not be declared twice as different types
-- Case Type: Negative
-- Error Category: duplicate_declaration_error
-- Test Focus: Negative example: the entity declarative part first declares type t_item is (a,b,c), then declares constant t_item:integer:=1, the same identifier t_item is first declared as an enumeration type and then redeclared as an integer constant, verifying the identifier uniqueness semantic rule in the entity declarative part
-- Expected Result: Triggers semantic error: duplicate identifier t_item in entity declarative part
-- Dependencies: None
-- =============================================================
entity edp_smn2_ent is
  port(y:out integer);
  type t_item is (a,b,c);
  constant t_item:integer:=1;
end entity edp_smn2_ent;
architecture bh of edp_smn2_ent is
begin y<=t_item; end architecture bh;
