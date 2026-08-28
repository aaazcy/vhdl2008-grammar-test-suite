-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Negative
-- Test Focus: SNN: incompatible default value type in constant_declaration in the block declarative part — an integer constant initialized with a bit value, verifying that the initialization expression type must match in a constant declaration
-- Expected Result: Triggers semantic error: type mismatch in constant initialization
-- Dependencies: None
-- =============================================================
entity bdi_snn5_ent is
  port(x : in bit; y : out bit);
end entity;
architecture bh of bdi_snn5_ent is
begin
  b_bad : block
    constant C_BAD : integer := '1';
    signal s : bit := x;
  begin
    s <= x;
    y <= s;
  end block;
end architecture bh;
