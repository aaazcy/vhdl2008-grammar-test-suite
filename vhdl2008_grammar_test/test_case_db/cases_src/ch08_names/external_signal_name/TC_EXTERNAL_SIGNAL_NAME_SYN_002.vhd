-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External signal name with absolute pathname — <<signal .tb_top.uut.clk : bit>> references a hierarchical signal through absolute pathname, exercising external_signal_name in a monitor/verification context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_sig_abs_mon is
  port(local_clk : in bit; sync_flag : out bit);
end entity;

architecture vhdl2008 of ext_sig_abs_mon is
  alias tb_clk is <<signal .tb_top.clk_gen : bit>>;
  signal clk_synced : bit := '0';
begin
  process(local_clk)
  begin
    if local_clk'event and local_clk = '1' then
      clk_synced <= tb_clk;
    end if;
  end process;
  sync_flag <= clk_synced;
end architecture vhdl2008;
