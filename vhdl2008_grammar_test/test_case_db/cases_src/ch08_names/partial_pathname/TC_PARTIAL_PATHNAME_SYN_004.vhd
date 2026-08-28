-- =============================================================
-- Case ID: TC_PARTIAL_PATHNAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARTIAL_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: partial_pathname ::= { pathname_element . } object_simple_name
-- Case Type: Positive
-- Test Focus: Single-level pathname_element + object——ent.arch.sig_name contains two pathname_elements (ent, arch) plus one object_simple_name (sig_name), verifying the syntax with multiple repetitions of { pathname_element . }
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity part_path_multi_elem is
  port(clk : in bit; captured : out bit_vector(3 downto 0));
end entity;

architecture vhdl2008 of part_path_multi_elem is
  alias dut_data is <<signal .tb_top.u_dut.u_alu.result : bit_vector(3 downto 0)>>;
  signal snap : bit_vector(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then snap <= dut_data; end if;
  end process;
  captured <= snap;
end architecture vhdl2008;
