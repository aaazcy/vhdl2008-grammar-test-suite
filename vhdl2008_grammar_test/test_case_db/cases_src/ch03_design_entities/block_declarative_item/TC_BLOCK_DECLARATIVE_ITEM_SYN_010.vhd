-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Positive
-- Test Focus: block_declarative_item with disconnection_specification and group_template_declaration+group_declaration: guarded signal disconnection specification and group declaration in the block, verifying the syntactic legality of these two special declaration items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdi_disc_ent is
  port(ctrl : in bit; q : out bit);
end entity;
architecture bh of bdi_disc_ent is
begin
  b_disc : block(ctrl = '1')
    function resolve_bit(v:bit_vector) return bit is
    begin
      return v(v'left);
    end function resolve_bit;
    subtype r_bit is resolve_bit bit;
    signal s_guarded : r_bit register;
    signal s_bus : r_bit bus;
    disconnect s_guarded : r_bit after 2 ns;
    disconnect s_bus : r_bit after 3 ns;
    group gt_pair is (signal, signal);
    group g_grp : gt_pair(s_guarded, s_bus);
  begin
    s_guarded <= guarded '1';
    s_bus <= guarded s_guarded;
    q <= s_bus;
  end block;
end architecture bh;
