-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External signal name using a relative_pathname — alias parent_enable is <<signal ^.^.ctrl_unit.enable : bit>> accesses the control unit enable signal two levels up through the ^ symbol, verifying the syntax of relative_pathname in external_signal_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_sig_rel_path is
  port(my_clk : in bit; gated : out bit);
end entity;

architecture vhdl2008 of ext_sig_rel_path is
  alias parent_en is <<signal ^.^.ctrl_unit.enable : bit>>;
  signal gate_reg : bit := '0';
begin
  process(my_clk)
  begin
    if rising_edge(my_clk) then gate_reg <= parent_en and my_clk; end if;
  end process;
  gated <= gate_reg;
end architecture vhdl2008;
