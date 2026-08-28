-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Negative
-- Test Focus: SNN: type_declaration in the block declarative part missing the range keyword — the missing "range" when the type defines an integer range makes the BNF type_definition fail
-- Expected Result: Triggers syntax error: "range" keyword expected in integer type definition
-- Dependencies: None
-- =============================================================
entity bdi_snn6_ent is
  port(d : in integer; q : out integer);
end entity;
architecture bh of bdi_snn6_ent is
begin
  b_bad : block
    type t_bad is 0 to 255;
    signal s : t_bad := 0;
  begin
    s <= t_bad(d);
    q <= integer(s);
  end block;
end architecture bh;
