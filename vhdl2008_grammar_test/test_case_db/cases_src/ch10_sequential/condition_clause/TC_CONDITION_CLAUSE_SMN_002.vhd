-- =============================================================
-- Case ID: TC_CONDITION_CLAUSE_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_COND_CLAUSE_NON_BOOLEAN
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Production: condition_clause ::= until condition
-- Case Type: Negative
-- Test Focus: SMN: condition of until uses an integer literal - in wait until 5 the condition is integer type, not convertible to boolean
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity cc_int_condition is port(y:out integer); end entity;
architecture vhdl2008 of cc_int_condition is
begin
  process is
  begin
    wait until 5;
    y <= 0;
  end process;
end architecture vhdl2008;
