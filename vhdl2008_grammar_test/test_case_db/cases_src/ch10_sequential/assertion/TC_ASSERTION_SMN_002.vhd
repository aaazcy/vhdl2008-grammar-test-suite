-- =============================================================
-- Case ID: TC_ASSERTION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_ASSERTION_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Assert condition must be convertible to a boolean expression — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: assert condition uses integer literal 7 - another variant of non-boolean type
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity assert_cond_int7_ent is
end entity assert_cond_int7_ent;

architecture smn of assert_cond_int7_ent is
begin
  process is
  begin
    assert 7 report "integer condition" severity warning;
    wait;
  end process;
end architecture smn;
