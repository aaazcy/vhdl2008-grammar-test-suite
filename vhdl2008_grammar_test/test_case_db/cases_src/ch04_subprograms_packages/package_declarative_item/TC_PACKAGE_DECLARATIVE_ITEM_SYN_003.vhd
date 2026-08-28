-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Positive
-- Test Focus: signal_declaration as package_declarative_item: signal s_status:bit:='1', verification that signal_declaration is legal only in package_declarative_item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sig_item is
  signal s_ready:bit:='0';
end package pkg_sig_item;
entity pdi_sig_ent is port(r:out bit); end entity;
architecture bh of pdi_sig_ent is begin r<=work.pkg_sig_item.s_ready; end architecture bh;
