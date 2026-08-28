-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SYN_002
-- Rule Type: Syntax
-- BNF Production: DECIMAL_LITERAL
-- IEEE Section: 15.5.1
-- BNF Text: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Test Focus: Real decimal literals with fractional part used in time and real constants
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity decimal_literal_syn_002 is
  port (
    period_out : out time;
    gain_out   : out real
  );
end entity decimal_literal_syn_002;

architecture bh of decimal_literal_syn_002 is
  -- Real decimal literal with fractional part (integer . integer)
  constant C_CLK_PERIOD : time := 10.5 ns;
  constant C_GAIN       : real := 2.71828;
  constant C_OFFSET     : real := 0.001;
  signal s_period       : time := 0 ns;
  signal s_gain         : real := 0.0;
begin
  s_period <= C_CLK_PERIOD;
  s_gain   <= C_GAIN;
  period_out <= s_period;
  gain_out   <= s_gain;
end architecture bh;
