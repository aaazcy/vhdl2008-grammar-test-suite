-- =============================================================
-- Case ID: TC_PATHNAME_ELEMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_PATHNAME_ELEMENT_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: pathname_element ::= entity_simple_name | component_instantiation_label
-- Case Type: Positive
-- Rule Description: Multiple elements in a pathname_element chain mixing entity_simple_name and component_instantiation_label must keep the correct hierarchy relationship
-- Test Focus: Semantic positive case——in the hierarchy path .tb_top(entity name).gen_block(0)(generate index).pipe_reg, entity names and generate block indexes are mixed, and every pathname_element legally corresponds to a design hierarchy level
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pn_elem_gen_idx is
  port(clk : in bit; reg_val : out bit);
end entity;

architecture vhdl2008 of pn_elem_gen_idx is
  alias pipe_reg is <<signal .tb_top.u_core.gen_pipe.pipeline_reg : bit>>;
  signal snap : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then snap <= pipe_reg; end if;
  end process;
  reg_val <= snap;
end architecture vhdl2008;
