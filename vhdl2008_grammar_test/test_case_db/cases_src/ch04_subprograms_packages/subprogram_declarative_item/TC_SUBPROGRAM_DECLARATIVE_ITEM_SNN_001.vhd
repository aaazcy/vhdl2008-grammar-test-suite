-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_ITEM_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: SNN: signal_declaration must not appear in subprogram_declarative_item - subprogram body can contain variable but not signal
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity sdi_bad_ent is port(r:out integer); end entity;
architecture bh of sdi_bad_ent is
  function f_broken return integer is
    -- ERROR: signal_declaration is not a legal subprogram_declarative_item
    signal s_bad:integer:=0;
  begin
    return 0;
  end function;
begin
  r<=0;
end architecture bh;
