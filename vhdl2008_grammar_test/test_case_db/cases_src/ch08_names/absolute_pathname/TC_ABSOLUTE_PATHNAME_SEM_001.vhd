-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_ABSOLUTE_PATHNAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Positive
-- Rule Description: In absolute_pathname, each pathname_element of the partial_pathname after the '.' must resolve, in hierarchical order, to an actual declared object in the design
-- Test Focus: Positive semantic case — every pathname_element level in the .tb_top.u_dut.data_bus path corresponds to a real design hierarchy level (tb_top → u_dut → data_bus), the external alias resolves correctly to the target signal, and its value can be read successfully in a process
-- Expected Result: Compiles successfully (elaboration resolves all pathname_elements)
-- Dependencies: None
-- =============================================================
entity abs_path_valid_res is
  port(clk : in bit; tracked : out bit_vector(7 downto 0));
end entity;

architecture vhdl2008 of abs_path_valid_res is
  alias dut_bus is <<signal .tb_top.u_dut.data_bus : bit_vector(7 downto 0)>>;
  signal shadow : bit_vector(7 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      shadow <= dut_bus;
    end if;
  end process;
  tracked <= shadow;
end architecture vhdl2008;
