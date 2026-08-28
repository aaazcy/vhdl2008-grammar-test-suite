-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Negative
-- Test Focus: SNN: function_body in the block declarative part missing the "is" keyword — the function definition lacks "is" so the parser cannot recognize the start of the subprogram body, verifying that in the BNF the subprogram body must include is
-- Expected Result: Triggers syntax error: "is" keyword expected in function body
-- Dependencies: None
-- =============================================================
entity bdi_snn4_ent is
  port(a : in integer; y : out integer);
end entity;
architecture bh of bdi_snn4_ent is
begin
  b_bad : block
    function f_dbl(x : integer) return integer
    begin
      return x * 2;
    end function;
    signal s_r : integer := 0;
  begin
    s_r <= f_dbl(a);
    y <= s_r;
  end block;
end architecture bh;
