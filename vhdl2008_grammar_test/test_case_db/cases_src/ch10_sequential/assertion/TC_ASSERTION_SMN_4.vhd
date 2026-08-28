-- =============================================================
-- Case ID: TC_ASSERTION_SMN_4
-- Rule Type: Semantic
-- Related Rule ID: SEM_ASSERTION_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Assertion condition must be convertible to a BOOLEAN expression
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: assert condition uses an integer literal - in assert 42 the condition is integer type, not convertible to BOOLEAN
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity assert_cond_int_ent is
end entity assert_cond_int_ent;

architecture sem of assert_cond_int_ent is
begin
  process is
  begin
    assert 42 report "condition is not boolean" severity note;
    wait;
  end process;
end architecture sem;
