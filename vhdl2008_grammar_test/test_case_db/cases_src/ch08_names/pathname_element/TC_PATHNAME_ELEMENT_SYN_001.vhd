-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Positive
-- Test Focus: Minimal pathname_element choosing the entity_simple_name alternative——tb_top in .tb_top is an entity simple name, verifying the pathname_element syntax that identifies an entity name in an external path
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pn_elem_entity_min is
  port(clk : in bit; mon : out bit);
end entity;

architecture vhdl2008 of pn_elem_entity_min is
  alias top_clk is <<signal .tb_top.clk_gen : bit>>;
  signal reg : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= top_clk; end if;
  end process;
  mon <= reg;
end architecture vhdl2008;
