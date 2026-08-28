-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: subtype_declaration + alias_declaration + attribute_specification three body declarative items used consecutively, verification of a medium-density declaration item sequence
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sub_alias is
  type t_range is range 0 to 255;
end package pkg_sub_alias;
package body pkg_sub_alias is
  subtype t_byte is t_range range 0 to 127;
  constant C_HI:t_range:=t_range'high;
  alias a_hi:t_range is C_HI;
  attribute a_note:string;
  attribute a_note of t_byte:subtype is "half-range byte";
end package body pkg_sub_alias;
entity pbdi_sa_ent is port(r:out integer); end entity;
architecture bh of pbdi_sa_ent is begin r<=integer(work.pkg_sub_alias.t_range'high); end architecture bh;
