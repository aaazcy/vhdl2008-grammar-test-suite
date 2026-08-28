-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_014
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Condition in assertion must be convertible to a BOOLEAN expression — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: condition of the assert statement uses integer literal 5 - integer type cannot be converted to BOOLEAN
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity assert_stmt_int_ent is
end entity assert_stmt_int_ent;

architecture smn of assert_stmt_int_ent is
begin
  process is
  begin
    assert 5 report "integer cannot be condition" severity warning;
    wait;
  end process;
end architecture smn;
