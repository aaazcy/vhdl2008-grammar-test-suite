-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Positive
-- Test Focus: block_declarative_item with component_declaration and configuration_specification: the block declares a component and binds an entity with configuration_specification, verifying the syntactic legality of these two declaration kinds within a block
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity xor2 is
  port (i1, i2 : in bit; o : out bit);
end entity xor2;

architecture rtl of xor2 is
begin
end architecture rtl;

entity bdi_comp_ent is
  port(a, b : in bit; y : out bit);
end entity;
architecture bh of bdi_comp_ent is
begin
  b_comp : block
    component xor2 is port(i1, i2 : in bit; o : out bit); end component;
    for u_xor : xor2 use entity work.xor2(rtl);
    signal s_xor : bit;
  begin
    u_xor : xor2 port map(i1 => a, i2 => b, o => s_xor);
    y <= s_xor;
  end block;
end architecture bh;
