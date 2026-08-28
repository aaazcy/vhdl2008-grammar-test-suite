-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Negative
-- Test Focus: package_declarative_item: port declaration is NOT a valid item — port declarations belong to entity interfaces, not package declarative items; a port clause inside a package declaration is a syntax error
-- Expected Result: Triggers syntax error: 'end' is expected instead of 'port'
-- Dependencies: None
-- =============================================================
package pdi_port_pkg is
  port(x : in bit; y : out bit);
end package pdi_port_pkg;
