-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: package_body_declarative_item: signal_declaration is NOT a valid alternative — the BNF explicitly lists package_body_declarative_item alternatives and 'signal_declaration' is NOT among them for package_body; putting a signal declaration directly in a package body is a syntax error
-- Expected Result: Triggers syntax error: signal declaration not allowed in package body
-- Dependencies: None
-- =============================================================
package pbdi_sig_pkg is
end package pbdi_sig_pkg;
package body pbdi_sig_pkg is
  signal s_illegal : bit := '1';
end package body pbdi_sig_pkg;
