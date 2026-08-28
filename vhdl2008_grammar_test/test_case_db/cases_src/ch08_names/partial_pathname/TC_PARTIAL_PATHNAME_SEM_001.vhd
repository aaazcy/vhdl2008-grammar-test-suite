-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_PARTIAL_PATHNAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Positive
-- Rule Description: In a partial_pathname every pathname_element must reference an actually existing entity name or instance label, and the object_simple_name must reference an actual object
-- Test Focus: Semantic positive case——in .tb_top.u_dut.data_out, tb_top is the top-level entity, u_dut is the instance label, data_out is a port/signal of that instance; the full path is legal in the elaborated hierarchy
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity part_path_valid_sem is
  port(clk : in bit; resolved : out bit);
end entity;

architecture vhdl2008 of part_path_valid_sem is
  alias dut_ready is <<signal .tb_top.u_dut.ready : bit>>;
  signal reg : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then reg <= dut_ready; end if;
  end process;
  resolved <= reg;
end architecture vhdl2008;
