-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name | external_signal_name | external_variable_name
-- Case Type: Positive
-- Test Focus: external_name used for a hierarchical verification monitor — in the verification monitor entity, the three kinds of external_name respectively monitor the constant configuration, output signals, and internal variables of the design under test, simulating a UVM-style cross-hierarchy checker architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_name_verif_mon is
  port(sample_clk : in bit; mismatch : out bit);
end entity;

architecture vhdl2008 of ext_name_verif_mon is
  alias CFG_DELAY is <<constant @work.tb_cfg.EXPECTED_DELAY : time>>;
  alias DUT_OUT is <<signal .tb_top.u_core.data_out : bit_vector(7 downto 0)>>;
  alias DUT_EXP is <<variable .tb_top.scoreboard.expected : bit_vector(7 downto 0)>>;
  signal err_flag : bit := '0';
begin
  process(sample_clk)
  begin
    if rising_edge(sample_clk) then
      if DUT_OUT /= DUT_EXP then
        err_flag <= '1' after CFG_DELAY;
      else
        err_flag <= '0';
      end if;
    end if;
  end process;
  mismatch <= err_flag;
end architecture vhdl2008;
