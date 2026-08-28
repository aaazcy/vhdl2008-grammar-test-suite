-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Positive
-- Test Focus: Mixed entity names and instance labels——.tb_top(entity name).u_core(instance label).u_alu(instance label).result mixes entity names and instance labels in three pathname_elements, verifying the two can be used interchangeably in a path
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pn_elem_mixed_types is
  port(clk : in bit; result : out bit_vector(15 downto 0));
end entity;

architecture vhdl2008 of pn_elem_mixed_types is
  alias deep_result is <<signal .tb_top.u_core.u_alu.result : bit_vector(15 downto 0)>>;
  signal reg : bit_vector(15 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= deep_result; end if;
  end process;
  result <= reg;
end architecture vhdl2008;
