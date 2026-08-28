-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Positive (Production-Specific)
-- Test Focus: External constant name with absolute pathname referencing top-level generics:
--   <<constant .tb_top.dut_inst.CLK_PERIOD : time>>
--   Verifies the dot-prefixed absolute path form within a constant declaration.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ext_const_abs_monitor is
  port (
    clk          : in  bit;
    period_err   : out bit
  );
end entity ext_const_abs_monitor;

architecture vhdl2008 of ext_const_abs_monitor is
  -- External constant name using absolute pathname (dot-prefixed partial pathname)
  -- References a top-level testbench generic through the hierarchy
  constant C_EXPECTED_PERIOD : time :=
    <<constant .tb_top.dut_inst.CLK_PERIOD : time>>;

  signal last_rise : time := 0 ns;
  signal measured  : time := 0 ns;
begin
  -- Measure clock period and compare against externally-referenced constant
  p_measure : process(clk)
  begin
    if clk'event and clk = '1' then
      if last_rise > 0 ns then
        measured <= now - last_rise;
      end if;
      last_rise <= now;
    end if;
  end process p_measure;

  period_err <= '1' when measured /= C_EXPECTED_PERIOD else '0';
end architecture vhdl2008;
