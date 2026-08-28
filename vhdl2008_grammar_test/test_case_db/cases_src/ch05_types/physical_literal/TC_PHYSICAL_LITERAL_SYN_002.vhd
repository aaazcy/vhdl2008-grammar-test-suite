-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Positive
-- Test Focus: Integer abstract_literal with unit_name — exercises the optional abstract_literal (integer form) combined with a unit name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity phys_lit_int_scaled is
  port(
    period_in   : in  time;
    period_out  : out time
  );
end entity;

architecture freq_scaler of phys_lit_int_scaled is
  constant C_CLK_PERIOD : time := 10 ns;
  constant C_HALF_CYCLE : time := 5 ns;
  constant C_SETUP_TIME  : time := 3 ns;
  constant C_HOLD_TIME   : time := 2 ns;
  signal scaled : time := 0 fs;
begin
  scaled <= period_in / 2;
  period_out <= scaled when period_in > C_CLK_PERIOD
                else C_HALF_CYCLE;
end architecture;
