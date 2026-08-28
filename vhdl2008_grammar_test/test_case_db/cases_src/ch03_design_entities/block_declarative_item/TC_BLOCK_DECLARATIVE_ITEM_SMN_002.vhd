-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Negative
-- Test Focus: SEM: two constant declarations in the block declarative part have the same name — the identifier s_val is declared twice in the same declarative part, verifying the identifier uniqueness rule
-- Expected Result: Triggers semantic error: duplicate identifier in block declarative region
-- Dependencies: None
-- =============================================================
entity bdi_sem2_ent is
  port(a : in bit; y : out bit);
end entity;
architecture bh of bdi_sem2_ent is
begin
  b_bad : block
    constant C_THRESH : integer := 5;
    constant C_THRESH : integer := 10;
    signal s : bit := a;
  begin
    s <= a;
    y <= s;
  end block;
end architecture bh;
