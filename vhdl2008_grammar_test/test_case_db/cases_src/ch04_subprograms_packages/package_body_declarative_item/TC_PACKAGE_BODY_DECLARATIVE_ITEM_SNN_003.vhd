-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: package_body_declarative_item: component_declaration is NOT valid — component_declaration is allowed in package_declarative_item (for package declarations) but NOT in package_body_declarative_item; using a component in a package body is a syntax error
-- Expected Result: Triggers syntax error: component declaration are not allowed here
-- Dependencies: None
-- =============================================================
package pbdi_comp_pkg is
end package pbdi_comp_pkg;
package body pbdi_comp_pkg is
  component illegal_comp is
    port (x : in bit; y : out bit);
  end component;
end package body pbdi_comp_pkg;
