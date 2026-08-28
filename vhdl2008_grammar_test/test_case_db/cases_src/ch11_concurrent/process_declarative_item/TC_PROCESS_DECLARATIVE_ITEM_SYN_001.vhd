-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: Minimal variable_declaration——`variable v_cnt : integer := 0;` verifies that variable is the most common process_declarative_item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdi_var_ent is
  port(clk : in bit; q : out integer);
end entity pdi_var_ent;
architecture bh of pdi_var_ent is
begin
  process(clk) is
    variable v_cnt : integer := 0;
  begin
    if clk'event and clk = '1' then
      v_cnt := v_cnt + 1;
      q <= v_cnt;
    end if;
  end process;
end architecture bh;
