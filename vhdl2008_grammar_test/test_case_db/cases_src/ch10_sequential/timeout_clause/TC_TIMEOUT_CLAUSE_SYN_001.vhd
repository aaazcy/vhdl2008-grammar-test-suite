-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_TIMEOUT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: timeout_clause ::= for time_expression
-- Case Type: Positive
-- Test Focus: Timeout clause with constant + expression + physical literal: wait for C_TO + wait for 10 ns + wait for G_DLY (via generic), verifying that the time_expression of timeout_clause can use a constant, a literal, and a generic
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc2_ent is generic(G_DLY:time:=100 ns); port(y:out integer); end entity;
architecture bh of tc2_ent is
  constant C_TO:time:=50 ns; signal s_cnt:integer:=0;
begin
  process is begin
    wait for C_TO; s_cnt<=s_cnt+1;
    wait for 10 ns; s_cnt<=s_cnt+5;
    wait for G_DLY; y<=s_cnt;
  end process;
end architecture bh;
