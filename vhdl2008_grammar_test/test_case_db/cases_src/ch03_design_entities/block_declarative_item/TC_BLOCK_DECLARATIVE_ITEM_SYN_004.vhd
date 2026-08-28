-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Positive
-- Test Focus: block_declarative_item with alias_declaration and attribute_declaration+attribute_specification: an alias in the block references a signal and is annotated with attribute declaration and attribute specification, verifying the syntactic legality of alias and attribute items as declaration members
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdi_attr_ent is
  port(data : in integer; flag : out integer);
end entity;
architecture bh of bdi_attr_ent is
begin
  b_attr : block
    type t_data is range 0 to 255;
    signal s_raw : t_data := 0;
    alias a_data : t_data is s_raw;
    attribute pipeline_stage : integer;
    attribute pipeline_stage of s_raw : signal is 1;
    attribute pipeline_stage of b_attr : label is 2;
  begin
    s_raw <= t_data(data);
    flag <= integer(a_data) when integer(a_data) < 128 else 0;
  end block;
end architecture bh;
