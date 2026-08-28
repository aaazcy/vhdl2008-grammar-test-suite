-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Positive
-- Test Focus: alias_declaration + attribute_specification as a package_declarative_item combination: verification of alias and attribute declaration use in package declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_aa_item is
  constant C_PI:real:=3.14159;
  alias a is bit;
  attribute a_note:string;
  attribute a_note of C_PI:constant is "math constant";
end package pkg_aa_item;
entity pdi_aa_ent is port(r:out real); end entity;
architecture bh of pdi_aa_ent is begin r<=work.pkg_aa_item.C_PI; end architecture bh;
