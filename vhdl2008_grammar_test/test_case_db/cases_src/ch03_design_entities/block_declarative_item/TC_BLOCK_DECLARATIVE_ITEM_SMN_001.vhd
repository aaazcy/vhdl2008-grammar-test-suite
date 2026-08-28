-- =============================================================
-- Case ID: TC_BLOCK_DECLARATIVE_ITEM_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_BLOCK_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.3.2
-- Production: block_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | signal_declaration | shared_variable_declaration | file_declaration | alias_declaration | component_declaration | attribute_declaration | attribute_specification | configuration_specification | disconnection_specification | use_clause | group_template_declaration | group_declaration | PSL_Property_Declaration | PSL_Sequence_Declaration | PSL_Clock_Declaration
-- Case Type: Negative
-- Test Focus: SMN: in the block declarative part, the function return value type does not match the return expression type — the function is declared to return boolean but the return returns integer
-- Expected Result: Triggers semantic error: return type mismatch in function body
-- Dependencies: None
-- =============================================================
entity bdi_smn1_ent is
  port(x : in integer; y : out integer);
end entity;
architecture bh of bdi_smn1_ent is
begin
  b_bad : block
    function f_check(v : integer) return boolean is
    begin
      return v;
    end function;
  begin
    y <= x;
  end block;
end architecture bh;
