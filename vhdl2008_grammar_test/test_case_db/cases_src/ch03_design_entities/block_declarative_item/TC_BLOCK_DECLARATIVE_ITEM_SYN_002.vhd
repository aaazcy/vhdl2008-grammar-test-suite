-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Positive
-- Test Focus: block_declarative_item with type_declaration and constant_declaration: the block declares a custom integer type and a constant based on that type, and the statement part uses the declared items via signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bdi_typ_ent is
  port(offset : in integer; result : out integer);
end entity;
architecture bh of bdi_typ_ent is
begin
  b_type : block
    type t_addr is range 0 to 65535;
    constant C_BASE : t_addr := 1024;
    signal s_addr : t_addr := C_BASE;
  begin
    s_addr <= C_BASE + t_addr(offset);
    result <= integer(s_addr);
  end block;
end architecture bh;
