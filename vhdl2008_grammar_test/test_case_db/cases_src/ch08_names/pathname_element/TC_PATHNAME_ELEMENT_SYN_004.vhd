-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PATHNAME_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Positive
-- Test Focus: pathname_element choosing the component_instantiation_label alternative——u_alu in .tb_top.u_alu is a component_instantiation_label, verifying the use of a pathname_element as an instance label in an external path
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pn_elem_inst_label is
  port(capture : in bit; val : out bit_vector(7 downto 0));
end entity;

architecture vhdl2008 of pn_elem_inst_label is
  alias dut_bus is <<signal .tb_top.u_alu.data_out : bit_vector(7 downto 0)>>;
  signal snap : bit_vector(7 downto 0) := (others => '0');
begin
  process(capture)
  begin
    if rising_edge(capture) then snap <= dut_bus; end if;
  end process;
  val <= snap;
end architecture vhdl2008;
