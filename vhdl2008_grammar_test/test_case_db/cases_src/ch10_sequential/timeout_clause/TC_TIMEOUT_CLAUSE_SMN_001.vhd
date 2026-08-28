-- =============================================================
-- Case ID: TC_TIMEOUT_CLAUSE_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_TIMEOUT_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: Timeout clause time expression must be of type time
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: the time expression of timeout_clause has a type error — in wait for 10 the time expression is an integer literal, the time_expression of timeout_clause must be of type time
-- Expected Result: Triggers analysis error: can't match integer literal with type physical type "time"
-- Dependencies: None
-- =============================================================
entity timeout_int_expr is port(y:out integer); end entity;
architecture vhdl2008 of timeout_int_expr is
begin
  process is
  begin
    wait for 10;
    y <= 0;
  end process;
end architecture vhdl2008;
