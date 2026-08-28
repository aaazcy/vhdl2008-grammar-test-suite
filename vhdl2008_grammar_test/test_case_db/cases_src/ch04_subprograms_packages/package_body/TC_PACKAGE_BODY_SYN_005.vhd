-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_body: constant declarations with computed values — exercises constant initialization expressions inside the declarative part, which is common in package bodies for derived parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_body_constants is
  port (
    period_out : out time;
    freq_out   : out real
  );
end entity pkg_body_constants;

architecture test of pkg_body_constants is
  constant C_CLK_PERIOD  : time    := 10 ns;
  constant C_CLK_HALF    : time    := C_CLK_PERIOD / 2;
  constant C_CLK_FREQ    : real    := 1.0e9 / real(C_CLK_PERIOD / 1 ns);
  constant C_DUTY_CYCLE  : real    := real(C_CLK_HALF / 1 ns) / real(C_CLK_PERIOD / 1 ns);
  constant C_SETUP_TIME   : time    := 1 ns;
  constant C_HOLD_TIME    : time    := 500 ps;

  signal s_period : time := C_CLK_PERIOD;
  signal s_freq   : real := C_CLK_FREQ;
begin
  period_out <= s_period;
  freq_out   <= s_freq;
end architecture test;
