-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_TIMEOUT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: timeout_clause ::= for time_expression
-- Case Type: Positive
-- Test Focus: Minimal wait for physical literal: `wait for 10 ns` — timeout_clause uses a literal time value
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_syn2_ent is port(y:out integer); end entity;
architecture bh of tc_syn2_ent is
  signal s_cnt : integer := 0;
begin
  process is
  begin
    wait for 10 ns;
    s_cnt <= s_cnt + 1;
    if s_cnt >= 5 then
      y <= s_cnt;
      wait;
    end if;
  end process;
end architecture bh;
