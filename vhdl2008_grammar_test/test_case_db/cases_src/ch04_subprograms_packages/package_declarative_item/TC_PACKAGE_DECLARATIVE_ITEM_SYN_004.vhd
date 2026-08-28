-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Positive
-- Test Focus: component_declaration as package_declarative_item: component reg with generic+port, verification that component declaration belongs to package declarative items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_comp_item is
  component dff is
    generic(tpd:time:=1 ns);
    port(clk:in bit; d:in bit; q:out bit);
  end component;
end package pkg_comp_item;
entity pdi_comp_ent is port(clk:in bit; d:in bit; q:out bit); end entity;
architecture bh of pdi_comp_ent is
  component dff is port(clk:in bit; d:in bit; q:out bit); end component;
begin
  dff_inst: dff port map(clk=>clk, d=>d, q=>q);
end architecture bh;
