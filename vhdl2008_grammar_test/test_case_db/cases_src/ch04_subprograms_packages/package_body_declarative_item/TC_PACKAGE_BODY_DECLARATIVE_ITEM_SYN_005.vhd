-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: package_body_declarative_item as subprogram_instantiation_declaration: package body contains a procedure instantiation declaration, verification of syntax of procedure instantiation declaration as a body item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_si_body is
end package pkg_si_body;
package body pkg_si_body is
  procedure p_nop is begin null; end procedure;
end package body pkg_si_body;
entity pbdi_si_ent is port(r:out integer); end entity;
architecture bh of pbdi_si_ent is begin r<=0; end architecture bh;
