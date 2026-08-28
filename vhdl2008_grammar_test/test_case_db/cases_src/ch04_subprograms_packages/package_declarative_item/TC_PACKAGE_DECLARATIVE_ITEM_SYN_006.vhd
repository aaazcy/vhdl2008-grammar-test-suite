-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_ITEM_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_item ::= subprogram_declaration | subprogram_instantiation_declaration | package_declaration | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration
-- Case Type: Positive
-- Test Focus: package_declarative_item: component_declaration alternative — exercises that component_declaration is a valid package_declarative_item (unlike package_body_declarative_item where it is NOT valid); shows component instantiation pattern
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdi_component_decl is
  port (
    a, b : in  bit;
    y    : out bit
  );
end entity;

architecture test of pdi_component_decl is
  -- component_declaration is a valid package_declarative_item
  component xor_gate is
    port (i0, i1 : in bit; o : out bit);
  end component;

  signal s_result : bit;
begin
  u_xor : xor_gate port map (i0 => a, i1 => b, o => s_result);
  y <= s_result;
end architecture test;
