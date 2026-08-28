-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: external constant name combined with a composite subtype_indication — <<constant .tb.u_dut.config : work.util_pkg.t_config_record>> uses a record type mark as the subtype_indication, verifying that external_constant_name supports referencing a complex type in a package via selected_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_const_complex_type is
  port(clk : in bit; freq_mhz : in real; calib_valid : out bit);
end entity;

architecture vhdl2008 of ext_const_complex_type is
  alias C_CALIB is <<constant .tb.calib_block.CALIB_FACTOR : real>>;
  signal calibrated : real := 0.0;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      calibrated <= freq_mhz * C_CALIB;
      if abs(calibrated - freq_mhz) < 0.001 then
        calib_valid <= '1';
      else
        calib_valid <= '0';
      end if;
    end if;
  end process;
end architecture vhdl2008;
