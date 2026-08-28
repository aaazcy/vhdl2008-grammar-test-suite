-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_TIMEOUT_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: Timeout clause time_expression must be of type time
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: timeout clause with integer instead of time
-- Expected Result: Triggers semantic error: timeout must be time type
-- Dependencies: None
-- =============================================================
entity timeout_sem1_ent is port(y:out integer); end entity;
architecture bh of timeout_sem1_ent is
  signal s_cnt:integer:=0;
begin
  process is
  begin
    wait on s_cnt for 100;
    y<=s_cnt;
  end process;
end architecture bh;
