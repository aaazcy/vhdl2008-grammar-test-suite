-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_item ::= subprogram_declaration subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: process_declarative_item: type mismatch in declaration
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity process_declara_e3 is end entity;
architecture bh of process_declara_e3 is
  -- ERROR: type incompatibility
  signal s : integer := "string";
begin
end architecture bh;