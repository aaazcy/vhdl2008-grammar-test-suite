-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: Minimal form: subprogram_body as package_body_declarative_item - function body with a simple return, verification of a single subprogram_body as the only declaration item in package_body_declarative_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_min_body_item is
  function f_one return integer;
end package pkg_min_body_item;
package body pkg_min_body_item is
  function f_one return integer is begin return 1; end function;
end package body pkg_min_body_item;
entity pbdi_min_ent is port(r:out integer); end entity;
architecture bh of pbdi_min_ent is begin r<=work.pkg_min_body_item.f_one; end architecture bh;
