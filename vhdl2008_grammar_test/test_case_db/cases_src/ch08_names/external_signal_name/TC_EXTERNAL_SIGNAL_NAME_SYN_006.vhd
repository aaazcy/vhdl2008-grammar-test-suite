-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External signal name accessing a signal inside a generate block — alias gen_sig is <<signal .tb.u_core.gen_block(3).pipeline_reg : bit>>, the external_pathname contains the generate label index (3), verifying the use of an indexed_name path element in external_signal_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_sig_gen_idx is
  port(clk : in bit; reg_val : out bit);
end entity;

architecture vhdl2008 of ext_sig_gen_idx is
  alias gen_sig is <<signal .tb_top.u_core.gen_pipe(3).pipeline_reg : bit>>;
  signal snap : bit := '0';
begin
  process(clk)
  begin
    if rising_edge(clk) then snap <= gen_sig; end if;
  end process;
  reg_val <= snap;
end architecture vhdl2008;
