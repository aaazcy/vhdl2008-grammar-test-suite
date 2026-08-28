-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Positive
-- Test Focus: physical literal physical_literal — time units: physical_literals such as 10 ns, 1 us, 20 ms used in signal delay assignments
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity num_lit_physical_time is
  port (
    trigger : in  bit;
    pulse   : out bit
  );
end entity num_lit_physical_time;

architecture delay_line of num_lit_physical_time is
  constant C_WIDTH   : time := 10 ns;   -- physical_literal with ns unit
  constant C_HOLD_OFF : time := 1 us;    -- physical_literal with us unit
  constant C_TIMEOUT  : time := 20 ms;   -- physical_literal with ms unit
  constant C_ZERO_DELAY : time := 0 fs;  -- physical_literal: zero with unit
  signal s_pulse : bit := '0';
begin
  process
  begin
    wait until trigger = '1';
    s_pulse <= '1';
    wait for C_WIDTH;
    s_pulse <= '0';
    wait for C_HOLD_OFF;
  end process;
  pulse <= s_pulse;
end architecture delay_line;
