-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Negative
-- Test Focus: SNN: variable declaration missing the colon——`variable v integer := 0;` has no colon between the variable name and the type, verifying that a colon is required between the identifier and the subtype indication of a variable declaration
-- Expected Result: Triggers syntax error: missing ":" in variable declaration
-- Dependencies: None
-- =============================================================
entity pdi_snn1_ent is
  port(clk : in bit; q : out integer);
end entity pdi_snn1_ent;
architecture bh of pdi_snn1_ent is
begin
  process(clk) is
    variable v integer := 0;
  begin
    if clk'event and clk = '1' then
      v := v + 1; q <= v;
    end if;
  end process;
end architecture bh;
