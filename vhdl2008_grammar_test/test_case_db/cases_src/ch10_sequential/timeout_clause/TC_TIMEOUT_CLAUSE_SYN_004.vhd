-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TIMEOUT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: timeout_clause ::= for time_expression
-- Case Type: Positive
-- Test Focus: wait for with expression: `wait for dly_val * 2` — the time_expression of timeout_clause uses an arithmetic expression to compute the time value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_syn4_ent is port(dly_val:in time; y:out integer); end entity;
architecture bh of tc_syn4_ent is
  signal s_cnt : integer := 0;
begin
  process is
  begin
    wait for dly_val * 2;
    s_cnt <= s_cnt + 1;
    if s_cnt >= 2 then
      y <= s_cnt;
      wait;
    end if;
  end process;
end architecture bh;
