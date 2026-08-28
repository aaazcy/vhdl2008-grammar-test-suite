-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_item ::= subprogram_declaration subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: process_declarative_item: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity process_declara_e2 is end entity;
architecture bh of process_declara_e2 is
  -- ERROR: invalid syntax in process_declarative_item
  signal s : bit;
begin
  s <= '1'
end architecture bh;