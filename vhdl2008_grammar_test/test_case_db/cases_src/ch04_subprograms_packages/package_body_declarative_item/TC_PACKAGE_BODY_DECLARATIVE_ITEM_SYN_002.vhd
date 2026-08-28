-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: type_declaration as package_body_declarative_item: type t_vec is array(7 downto 0) of bit, verification that type_declaration is a legal body declarative item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_type_body is
  type t_vec is array(7 downto 0) of bit;
end package pkg_type_body;
package body pkg_type_body is
  type t_byte is array(7 downto 0) of bit;
  constant C_ZERO:t_byte:=(others=>'0');
end package body pkg_type_body;
entity pbdi_type_ent is port(r:out bit); end entity;
architecture bh of pbdi_type_ent is
  constant C_TOP:work.pkg_type_body.t_vec := (others=>'0');
begin
  r<=C_TOP(0);
end architecture bh;
