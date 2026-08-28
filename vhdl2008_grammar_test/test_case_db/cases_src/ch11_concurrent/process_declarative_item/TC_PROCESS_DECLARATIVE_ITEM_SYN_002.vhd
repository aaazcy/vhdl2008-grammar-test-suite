-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: Multiple kinds of declarations: constant + type + variable——the process declarative part contains a constant, a subtype and a variable, verifying that multiple declarative_item kinds can be mixed in a process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdi_multi_ent is
  port(clk : in bit; val : in integer; result : out integer);
end entity pdi_multi_ent;
architecture bh of pdi_multi_ent is
begin
  process(clk) is
    constant C_SCALE : integer := 2;
    subtype t_small is integer range 0 to 255;
    variable v_acc : t_small := 0;
  begin
    if clk'event and clk = '1' then
      v_acc := v_acc + val;
      result <= v_acc * C_SCALE;
    end if;
  end process;
end architecture bh;
