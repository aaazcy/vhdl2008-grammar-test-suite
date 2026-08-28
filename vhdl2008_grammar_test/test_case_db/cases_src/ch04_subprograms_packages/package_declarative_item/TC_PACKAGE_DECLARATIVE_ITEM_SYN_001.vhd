-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Positive
-- Test Focus: Minimal form: single constant_declaration as the only package_declarative_item - constant C:integer:=1, verification that a single declaration item can form package_declarative_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_min_item is
  constant C_ONE:integer:=1;
end package pkg_min_item;
entity pdi_min_ent is port(r:out integer); end entity;
architecture bh of pdi_min_ent is begin r<=work.pkg_min_item.C_ONE; end architecture bh;
