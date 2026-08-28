-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External signal name used directly in a conditional expression via alias — the external signal name bound by the alias is compared with a local signal directly in an if statement, verifying that external_signal_name is used as a readable signal value in a procedural context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_sig_direct_use is
  port(local_val : in bit_vector(3 downto 0); matched : out bit);
end entity;

architecture vhdl2008 of ext_sig_direct_use is
  alias dut_output is <<signal .tb_top.u_alu.result : bit_vector(3 downto 0)>>;
begin
  process(local_val)
  begin
    if local_val = dut_output then matched <= '1';
    else matched <= '0'; end if;
  end process;
end architecture vhdl2008;
