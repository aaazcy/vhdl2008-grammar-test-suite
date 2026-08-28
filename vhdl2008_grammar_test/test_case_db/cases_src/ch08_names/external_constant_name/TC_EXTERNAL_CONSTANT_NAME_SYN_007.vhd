-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: inline initialization of an external constant name in a constant declaration — constant C_GLOBAL_TIMING : time := <<constant .tb.clk_gen.PERIOD : time>>, using external_constant_name directly as the initial value expression in the constant declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_const_inline_init is
  port(clk : in bit; half_period : out time);
end entity;

architecture vhdl2008 of ext_const_inline_init is
  constant C_GLOBAL_TIMING : time := <<constant .tb.clk_gen.PERIOD : time>>;
  signal half_p : time := 0 fs;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      half_p <= C_GLOBAL_TIMING / 2;
    end if;
  end process;
  half_period <= half_p;
end architecture vhdl2008;
