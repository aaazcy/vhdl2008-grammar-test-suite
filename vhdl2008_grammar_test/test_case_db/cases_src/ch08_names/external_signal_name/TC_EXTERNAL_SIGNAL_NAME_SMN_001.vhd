-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_EXTERNAL_SIGNAL_NAME_002
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Negative
-- Rule Description: The entity class declared by external_signal_name is signal, so a signal alias cannot be the target of a variable assignment
-- Error Category: Illegal assignment target
-- Test Focus: SMN: an external_signal_name alias used in a variable assignment — in bad_sig := '1', bad_sig is the alias of a <<signal ...>> external signal name, and a signal is not a variable, so it cannot be the target of a variable assignment statement
-- Expected Result: Triggers analysis error (external signal name is not a variable to be assigned)
-- Dependencies: None
-- =============================================================
entity ext_sig_var_assign is
end entity;

architecture vhdl2008 of ext_sig_var_assign is
  alias bad_sig is <<signal .tb_top.u_dut.clk : bit>>;
begin
  process
  begin
    bad_sig := '1';
  end process;
end architecture vhdl2008;
