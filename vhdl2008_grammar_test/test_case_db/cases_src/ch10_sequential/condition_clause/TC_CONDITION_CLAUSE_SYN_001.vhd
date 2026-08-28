-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition_clause ::= until condition
-- Case Type: Positive
-- Test Focus: Minimal wait until - `wait until clk='1'` waits for the clock rising edge, condition is a simple boolean comparison
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cc_syn1_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of cc_syn1_ent is
  signal s_cnt : integer := 0;
begin
  process is
  begin
    wait until clk = '1';
    s_cnt <= s_cnt + 1;
    y <= s_cnt;
  end process;
end architecture bh;
