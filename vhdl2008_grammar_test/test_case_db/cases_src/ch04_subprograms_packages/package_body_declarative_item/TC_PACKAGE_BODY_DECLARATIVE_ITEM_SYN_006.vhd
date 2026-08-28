-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_ITEM_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: package_body_declarative_item: subprogram_body alternative — exercises that a complete subprogram body (function with declaration and implementation) is a valid alternative in the package_body_declarative_item BNF
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pbdi_subprogram_body is
  port (
    a, b : in  integer;
    sum  : out integer
  );
end entity;

architecture test of pbdi_subprogram_body is
  -- subprogram_body is a valid package_body_declarative_item
  function f_adder(x, y : integer) return integer is
  begin
    return x + y;
  end function;
begin
  sum <= f_adder(a, b);
end architecture test;
