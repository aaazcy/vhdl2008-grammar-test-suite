-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Positive
-- Test Focus: type_declaration + subtype_declaration as a package_declarative_item sequence: integer type + constrained subtype, verification of consecutive use of two declaration item classes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_tsd_item is
  type t_addr is range 0 to 1023;
  subtype t_page_addr is t_addr range 0 to 255;
  constant C_HOME:t_page_addr:=0;
end package pkg_tsd_item;
entity pdi_tsd_ent is port(r:out work.pkg_tsd_item.t_page_addr); end entity;
architecture bh of pdi_tsd_ent is begin r<=work.pkg_tsd_item.C_HOME; end architecture bh;
