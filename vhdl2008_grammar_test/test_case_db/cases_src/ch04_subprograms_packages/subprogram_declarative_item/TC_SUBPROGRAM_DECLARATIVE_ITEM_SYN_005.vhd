-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: file_declaration + attribute_declaration as subprogram_declarative_item in function: verification of file and attribute declaration use in function definition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdi_fa_ent is port(r:out integer); end entity;
architecture bh of sdi_fa_ent is
  function f_attr_demo return integer is
    attribute a_loc:string;
    variable v:integer:=0;
  begin
    return v;
  end function;
begin
  r<=f_attr_demo;
end architecture bh;
