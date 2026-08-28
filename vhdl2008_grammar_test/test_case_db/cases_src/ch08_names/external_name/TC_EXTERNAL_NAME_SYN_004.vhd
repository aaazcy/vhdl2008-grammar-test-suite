-- =============================================================
-- Case ID: TC_EXTERNAL_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_name ::= external_constant_name | external_signal_name | external_variable_name
-- Case Type: Positive
-- Test Focus: external_name selects the external_signal_name branch — binding a signal external name of the form <<signal .tb.uut.clk : bit>> via alias and reading the cross-hierarchy signal value in a process, verifying the syntax and semantics of the external_signal_name branch of external_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_name_signal_sel is
  port(local_clk : in bit; synced : out bit);
end entity;

architecture vhdl2008 of ext_name_signal_sel is
  alias top_clk is <<signal .tb_top.clk_gen : bit>>;
  signal sync_reg : bit := '0';
begin
  process(local_clk)
  begin
    if rising_edge(local_clk) then
      sync_reg <= top_clk;
    end if;
  end process;
  synced <= sync_reg;
end architecture vhdl2008;
