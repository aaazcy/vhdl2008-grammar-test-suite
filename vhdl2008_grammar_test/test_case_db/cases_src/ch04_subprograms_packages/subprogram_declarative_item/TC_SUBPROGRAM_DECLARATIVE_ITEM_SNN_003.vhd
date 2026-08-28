-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: subprogram_declarative_item: component_declaration is NOT valid — component_declaration is a package_declarative_item but NOT a subprogram_declarative_item; placing a component declaration inside a subprogram body is a syntax error
-- Expected Result: Triggers syntax error: component declaration are not allowed here
-- Dependencies: None
-- =============================================================
package sdi_comp_pkg is
  procedure p_bad;
end package sdi_comp_pkg;
package body sdi_comp_pkg is
  procedure p_bad is
    component c_x is port(i:in bit; o:out bit); end component;
  begin
    null;
  end procedure;
end package body sdi_comp_pkg;
