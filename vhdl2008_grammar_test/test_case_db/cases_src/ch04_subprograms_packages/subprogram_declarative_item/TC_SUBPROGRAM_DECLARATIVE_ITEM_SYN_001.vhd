-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: Minimal form: single variable_declaration as the only subprogram_declarative_item - procedure contains variable v:integer:=0, verification that variable is a legal subprogram declaration item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdi_min_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sdi_min_ent is
  function f_inc(x:integer) return integer is
    variable v:integer:=0;
  begin
    v:=x+1;
    return v;
  end function;
begin
  y<=f_inc(a);
end architecture bh;
