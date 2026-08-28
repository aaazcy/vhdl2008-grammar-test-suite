-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: package_body_declarative_item: incomplete type declaration (missing 'of' in array type) — a type_declaration is a valid item, but the type declaration itself is malformed (missing 'of' keyword between the index constraint and the element subtype), triggering a syntax error inside that item
-- Expected Result: Triggers syntax error: 'of' is expected instead of "bit_vector"
-- Dependencies: None
-- =============================================================
package pbdi_type_pkg is
end package pbdi_type_pkg;
package body pbdi_type_pkg is
  type bad_ram_t is array(natural range <>) bit_vector(7 downto 0);
end package body pbdi_type_pkg;
