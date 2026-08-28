-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: Minimal external signal name — alias top_clk is <<signal .tb.clk : bit>> accesses the top-level clock signal using the minimal form of absolute_pathname, verifying the basic syntax of external_signal_name starting with '<< signal'
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_sig_minimal is
  port(local_clk : in bit; synced : out bit);
end entity;

architecture vhdl2008 of ext_sig_minimal is
  alias top_clk is <<signal .tb_top.clk : bit>>;
  signal sreg : bit := '0';
begin
  process(local_clk)
  begin
    if rising_edge(local_clk) then sreg <= top_clk; end if;
  end process;
  synced <= sreg;
end architecture vhdl2008;
