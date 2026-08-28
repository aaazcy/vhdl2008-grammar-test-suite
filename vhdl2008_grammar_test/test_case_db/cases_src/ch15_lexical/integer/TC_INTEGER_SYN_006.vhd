-- =============================================================
-- Case ID: TC_INTEGER_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Positive
-- Test Focus: Integers used in physical types and time literals — integer as the numeric part of time values and physical literals
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity int_in_physical is
  port (
    delay_out : out time;
    count_out : out integer
  );
end entity int_in_physical;

architecture rtl of int_in_physical is
  constant C_DELAY_NS : time := 25 ns;
  constant C_CLK_MHZ  : integer := 100;
  signal s_ticks      : integer := 0;
begin
  s_ticks   <= C_CLK_MHZ;
  delay_out <= C_DELAY_NS;
  count_out <= s_ticks;
end architecture rtl;
