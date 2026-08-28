-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TIMEOUT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: timeout_clause ::= for time_expression
-- Case Type: Positive
-- Test Focus: wait for with constant time_expression: `wait for C_WAIT` — timeout_clause uses a constant as the time_expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_syn3_ent is port(y:out integer); end entity;
architecture bh of tc_syn3_ent is
  constant C_WAIT : time := 50 ns;
  signal s_cnt : integer := 0;
begin
  process is
  begin
    wait for C_WAIT;
    s_cnt <= s_cnt + 1;
    if s_cnt >= 3 then
      y <= s_cnt;
      wait;
    end if;
  end process;
end architecture bh;
