-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Negative
-- Test Focus: SEM: subtype range out of bounds in the block declarative part — the subtype constraint range exceeds the maximum defined by the base type, verifying that the subtype range_constraint must be within the base type range
-- Expected Result: Triggers semantic error: subtype range exceeds base type range
-- Dependencies: None
-- =============================================================
entity bdi_sem1_ent is
  port(x : in integer; y : out integer);
end entity;
architecture bh of bdi_sem1_ent is
begin
  b_bad : block
    type t_base is range 0 to 15;
    subtype t_beyond is t_base range 0 to 31;
    signal s : t_beyond := 0;
  begin
    y <= 0;
  end block;
end architecture bh;
