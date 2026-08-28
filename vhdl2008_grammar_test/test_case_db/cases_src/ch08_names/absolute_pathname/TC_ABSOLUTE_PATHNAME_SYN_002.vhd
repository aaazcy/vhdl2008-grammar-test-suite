-- =============================================================
-- Case ID: TC_ABSOLUTE_PATHNAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ABSOLUTE_PATHNAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: absolute_pathname ::= . partial_pathname
-- Case Type: Positive
-- Test Focus: absolute_pathname with dot-prefixed partial_pathname — '.tb_top.uut.clk' starts from the top of the design hierarchy; used in external signal name for cross-hierarchy monitoring
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity abs_path_sig_mon is
  port(local_clk : in bit; synced : out bit);
end entity;

architecture vhdl2008 of abs_path_sig_mon is
  alias top_clk is <<signal .tb_top.clk_gen : bit>>;
  signal sync_reg : bit := '0';
begin
  process(local_clk)
  begin
    if local_clk'event and local_clk = '1' then
      sync_reg <= top_clk;
    end if;
  end process;
  synced <= sync_reg;
end architecture vhdl2008;
