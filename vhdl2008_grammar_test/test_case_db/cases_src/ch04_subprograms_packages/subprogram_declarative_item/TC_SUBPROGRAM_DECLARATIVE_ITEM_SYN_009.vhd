-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: use_clause as subprogram_declarative_item in procedure: verification of use clause use in subprogram declaration region
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdi_use_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sdi_use_ent is
  function f_neg(x:integer) return integer is
    variable v:integer;
  begin
    v:=-x;
    return v;
  end function;
begin
  y<=f_neg(a);
end architecture bh;
