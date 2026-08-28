-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_PATHNAME_ELEMENT_001
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Positive
-- Rule Description: A pathname_element, whether an entity_simple_name or a component_instantiation_label, must correspond to a design unit already declared in the design hierarchy
-- Test Focus: Semantic positive case——in .tb_top(entity name).u_dut(instance label).status both levels of pathname_element correspond to the actually declared top level and instance, and the path is legal and resolvable
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pn_elem_valid_sem is
  port(clk : in bit; status : out bit);
end entity;

architecture vhdl2008 of pn_elem_valid_sem is
  alias dut_status is <<signal .tb_top.u_dut.status : bit>>;
  signal reg : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= dut_status; end if;
  end process;
  status <= reg;
end architecture vhdl2008;
