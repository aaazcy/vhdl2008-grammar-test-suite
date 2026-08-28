-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: subprogram_declarative_item: signal_declaration is NOT allowed — inside a subprogram body, only variable_declaration is valid for storage; signal_declaration is NOT a subprogram_declarative_item alternative and using it inside a subprogram is an error
-- Expected Result: Triggers syntax error: signal declaration not allowed in subprogram body
-- Dependencies: None
-- =============================================================
package sdi_sig_pkg is
  procedure p_increment(signal c : out natural);
end package sdi_sig_pkg;
package body sdi_sig_pkg is
  procedure p_increment(signal c : out natural) is
    signal s_local : bit := '0';
  begin
    c <= 1;
  end procedure;
end package body sdi_sig_pkg;
