-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: subprogram_declarative_item: disconnection_specification is NOT valid — disconnection_specification is a package_declarative_item only; using it inside a subprogram body is a syntax error
-- Expected Result: Triggers syntax error: disconnect specification not allowed here
-- Dependencies: None
-- =============================================================
package sdi_disc_pkg is
  procedure p_disc;
end package sdi_disc_pkg;
package body sdi_disc_pkg is
  procedure p_disc is
    disconnect all : bit after 1 ns;
  begin
    null;
  end procedure;
end package body sdi_disc_pkg;
