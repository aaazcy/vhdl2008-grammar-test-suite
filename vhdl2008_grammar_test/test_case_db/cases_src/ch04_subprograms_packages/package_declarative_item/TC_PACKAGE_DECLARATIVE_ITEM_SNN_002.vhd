-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Negative
-- Test Focus: package_declarative_item: subprogram_body is NOT listed as a valid package_declarative_item (it belongs to package_body_declarative_item); a full subprogram body placed directly in a package declaration is a syntax error
-- Expected Result: Triggers syntax error: subprogram body not allowed in a package
-- Dependencies: None
-- =============================================================
package pdi_body_pkg is
  function f_blocked(x : integer) return integer is
  begin
    return x + 1;
  end function;
end package pdi_body_pkg;
