-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: minimal external constant name — <<constant .cfg_pkg.TIMEOUT : time>> uses the simplest absolute_pathname (.cfg_pkg.TIMEOUT) plus a simple subtype_indication (time), verifying the minimal syntax structure of external_constant_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_const_minimal is
  port(clk : in bit; timeout_flag : out bit);
end entity;

architecture vhdl2008 of ext_const_minimal is
  alias C_TIMEOUT is <<constant .cfg_pkg.TIMEOUT : time>>;
  signal elapsed : time := 0 ns;
  signal triggered : bit := '0';
begin
  process(clk)
    variable last_time : time := 0 ns;
  begin
    if rising_edge(clk) then
      if last_time > 0 ns then
        elapsed <= now - last_time;
      end if;
      last_time := now;
      if elapsed > C_TIMEOUT then
        triggered <= '1';
      end if;
    end if;
  end process;
  timeout_flag <= triggered;
end architecture vhdl2008;
