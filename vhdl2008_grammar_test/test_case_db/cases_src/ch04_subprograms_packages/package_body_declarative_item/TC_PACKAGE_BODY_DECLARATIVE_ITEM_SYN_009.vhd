-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: file_declaration + alias_declaration as package_body_declarative_item: body contains file_open_information + alias, verification of file-related declaration item combination
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_file_body is
  type t_line is access string;
end package pkg_file_body;
package body pkg_file_body is
  alias a_str is string;
end package body pkg_file_body;
entity pbdi_file_ent is port(r:out integer); end entity;
architecture bh of pbdi_file_ent is begin r<=0; end architecture bh;
