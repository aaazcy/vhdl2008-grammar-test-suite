-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: subprogram_declarative_item containing subprogram_body (nested function): nested function declared in function and called in body, verification that subprogram_body is a legal subprogram declarative item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdi_nested_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of sdi_nested_ent is
  function f_outer(x,y:integer) return integer is
    function f_sqr(v:integer) return integer is
    begin return v*v; end function;
  begin
    return f_sqr(x)+f_sqr(y);
  end function;
begin
  y<=f_outer(a,b);
end architecture bh;
