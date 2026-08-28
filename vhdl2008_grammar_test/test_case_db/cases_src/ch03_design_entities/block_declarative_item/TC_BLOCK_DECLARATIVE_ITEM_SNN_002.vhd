-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Negative
-- Test Focus: block_declarative_item: invalid syntax element
-- Expected Result: Triggers syntax/semantic error
-- Dependencies: None
-- =============================================================
entity block_declarati_e2 is end entity;
architecture bh of block_declarati_e2 is
  -- ERROR: invalid syntax in block_declarative_item
  signal s : bit;
begin
  s <= '1'
end architecture bh;