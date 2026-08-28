-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SYN_S01
-- Rule Type: Syntax
-- BNF Production: TIMEOUT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Test Focus: Timeout clause: for time_expression — wait timeout specification
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_timeout_clause_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_timeout_clause_syn_s01 is
  signal s_tc:integer:=0;
begin
  process is
  begin
    wait for 5 ns; r<=s_tc+1;
  end process;
end architecture bh;
