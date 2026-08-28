-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Negative
-- Test Focus: package_declarative_item: shared variable without protected type — shared variable declarations are valid in package declarations but the variable type must be a protected type; a plain shared variable of integer type is illegal in VHDL-2008
-- Expected Result: Triggers semantic error: type of a shared variable must be a protected type
-- Dependencies: None
-- =============================================================
package pdi_shared_pkg is
  shared variable sv_counter : integer := 0;
end package pdi_shared_pkg;
