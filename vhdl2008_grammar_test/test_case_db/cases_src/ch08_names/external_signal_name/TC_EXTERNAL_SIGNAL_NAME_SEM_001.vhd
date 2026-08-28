-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EXTERNAL_SIGNAL_NAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Positive
-- Rule Description: The target resolved by the path in external_signal_name must be a signal, not a constant or a variable
-- Test Focus: Positive semantic case — in alias top_ready is <<signal .tb.u_dut.ready : bit>>, the .tb.u_dut.ready path references an actual signal declaration, the entity class matches the path target type, and the external signal value can be read correctly in a process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_sig_valid_sem is
  port(local_bit : in bit; synced : out bit);
end entity;

architecture vhdl2008 of ext_sig_valid_sem is
  alias top_ready is <<signal .tb_top.u_dut.ready_flag : bit>>;
  signal sreg : bit := '0';
begin
  process(local_bit)
  begin
    if rising_edge(local_bit) then sreg <= top_ready; end if;
  end process;
  synced <= sreg;
end architecture vhdl2008;
