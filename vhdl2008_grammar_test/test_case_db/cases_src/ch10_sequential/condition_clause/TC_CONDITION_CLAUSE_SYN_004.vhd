-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition_clause ::= until condition
-- Case Type: Positive
-- Test Focus: wait until + for coexisting - `wait until s_done='1' for 100 ns` - condition_clause + timeout_clause used together
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cc_syn4_ent is port(start:in bit; y:out integer); end entity;
architecture bh of cc_syn4_ent is
  signal s_done : bit := '0';
  signal s_cnt  : integer := 0;
begin
  process is
  begin
    wait until start = '1';
    s_cnt <= 0;
    wait until s_done = '1' for 100 ns;
    y <= s_cnt;
  end process;
end architecture bh;
