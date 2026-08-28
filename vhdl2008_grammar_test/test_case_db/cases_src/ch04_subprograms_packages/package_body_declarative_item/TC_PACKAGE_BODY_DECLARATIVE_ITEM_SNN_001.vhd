-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SNN_001.vhd
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: SNN: signal_declaration must not appear in package_body_declarative_item - signal is allowed only in package_declarative_item, body cannot contain signal
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
package pkg_sig_bad is end package;
package body pkg_sig_bad is
  -- ERROR: signal_declaration is not a legal package_body_declarative_item
  signal s_bad:integer:=0;
end package body pkg_sig_bad;
entity pbdi_bad_ent is port(r:out integer); end entity;
architecture bh of pbdi_bad_ent is begin r<=0; end architecture bh;
