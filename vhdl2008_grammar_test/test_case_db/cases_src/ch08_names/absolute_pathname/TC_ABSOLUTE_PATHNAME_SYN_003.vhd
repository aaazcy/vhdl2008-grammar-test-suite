-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Positive
-- Test Focus: absolute_pathname with deep hierarchy — '.tb_top.u_dut.u_alu.result' uses multiple pathname_elements in the partial_pathname following the dot prefix, exercising nested hierarchy traversal
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity abs_path_deep_mon is
  port(check_val : in bit_vector(7 downto 0); match : out bit);
end entity;

architecture vhdl2008 of abs_path_deep_mon is
  alias alu_result is <<signal .tb_top.u_dut.u_alu.result : bit_vector(7 downto 0)>>;
  signal match_reg : bit := '0';
begin
  process(check_val)
  begin
    if check_val = alu_result then
      match_reg <= '1';
    else
      match_reg <= '0';
    end if;
  end process;
  match <= match_reg;
end architecture vhdl2008;
