-- =============================================================
-- Case ID: TC_EXTERNAL_SIGNAL_NAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_SIGNAL_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_signal_name ::= << signal external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External signal name accessing a bus signal — alias dut_bus is <<signal .tb.u_dut.data_bus : bit_vector(15 downto 0)>>, the subtype_indication uses a constrained array form, verifying that an external signal name supports a subtype_indication of a composite type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_sig_bus_mon is
  port(capture : in bit; latched : out bit_vector(15 downto 0));
end entity;

architecture vhdl2008 of ext_sig_bus_mon is
  alias dut_bus is <<signal .tb_top.u_dut.data_bus : bit_vector(15 downto 0)>>;
  signal latch : bit_vector(15 downto 0) := (others => '0');
begin
  process(capture)
  begin
    if rising_edge(capture) then latch <= dut_bus; end if;
  end process;
  latched <= latch;
end architecture vhdl2008;
