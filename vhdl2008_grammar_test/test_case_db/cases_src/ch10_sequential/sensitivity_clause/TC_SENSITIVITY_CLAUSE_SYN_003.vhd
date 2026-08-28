-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SENSITIVITY_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: sensitivity_clause ::= on sensitivity_list
-- Case Type: Positive
-- Test Focus: wait on with multiple signals — `wait on a, b, c` — the sensitivity_clause monitors three signals, comma-separated, any change wakes the process
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sc_syn3_ent is port(a,b,c:in bit; y:out integer); end entity;
architecture bh of sc_syn3_ent is
  signal s_cnt : integer := 0;
begin
  process is
  begin
    wait on a, b, c;
    s_cnt <= s_cnt + 1;
    y <= s_cnt;
  end process;
end architecture bh;
