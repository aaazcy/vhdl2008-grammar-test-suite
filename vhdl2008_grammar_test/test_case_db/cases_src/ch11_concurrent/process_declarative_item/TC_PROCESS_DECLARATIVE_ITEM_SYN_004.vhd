-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_ITEM_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_item ::= subprogram_declaration | subprogram_body | subprogram_instantiation_declaration | package_declaration | package_body | package_instantiation_declaration | type_declaration | subtype_declaration | constant_declaration | variable_declaration | file_declaration | alias_declaration | attribute_declaration | attribute_specification | use_clause | group_template_declaration | group_declaration
-- Case Type: Positive
-- Test Focus: alias_declaration——the process declarative part defines an alias pointing to a signal, verifying that an alias is a legal process declarative item
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdi_alias_ent is
  port(clk : in bit; data : in bit_vector(7 downto 0); msb : out bit);
end entity pdi_alias_ent;
architecture bh of pdi_alias_ent is
begin
  process(clk) is
    alias a_msb is data(7);
    variable v_bit : bit;
  begin
    if clk'event and clk = '1' then
      v_bit := a_msb;
      msb <= v_bit;
    end if;
  end process;
end architecture bh;
