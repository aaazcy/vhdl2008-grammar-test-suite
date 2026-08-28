-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Positive
-- Test Focus: Maximum-depth absolute pathname — a six-level hierarchy path .tb_top.u_soc.u_core.u_alu.u_adder.result, verifying that the partial_pathname in absolute_pathname supports an arbitrarily deep dot-separated chain of pathname_element levels
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity abs_path_max_depth is
  port(clk : in bit; captured : out bit_vector(15 downto 0));
end entity;

architecture vhdl2008 of abs_path_max_depth is
  alias deep_sig is <<signal .tb_top.u_soc.u_core.u_alu.u_adder.result : bit_vector(15 downto 0)>>;
  signal snap : bit_vector(15 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then
      snap <= deep_sig;
    end if;
  end process;
  captured <= snap;
end architecture vhdl2008;
