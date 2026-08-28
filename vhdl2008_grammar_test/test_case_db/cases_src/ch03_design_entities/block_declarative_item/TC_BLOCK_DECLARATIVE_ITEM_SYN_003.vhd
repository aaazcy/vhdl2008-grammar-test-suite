-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Positive
-- Test Focus: block_declarative_item with signal_declaration and subtype_declaration: the block declares a subtype constraining the base type range and multiple signal instances, verifying signal declaration and subtype derivation within block scope
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdi_sig_ent is
  port(in_vec : in bit_vector(7 downto 0); msb : out bit);
end entity;
architecture bh of bdi_sig_ent is
begin
  b_sig : block
    subtype t_nibble is bit_vector(3 downto 0);
    signal s_hi : t_nibble;
    signal s_lo : t_nibble;
    signal s_full : bit_vector(7 downto 0);
  begin
    s_full <= in_vec;
    s_hi <= s_full(7 downto 4);
    s_lo <= s_full(3 downto 0);
    msb <= s_hi(3);
  end block;
end architecture bh;
