-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_014
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Condition in assertion must be a BOOLEAN expression
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: condition of the assertion statement uses integer type instead of BOOLEAN - violates SEM_SEQ_014
-- Expected Result: Triggers semantic error: condition must be BOOLEAN
-- Dependencies: None
-- =============================================================
entity assert_stmt_sem1_ent is
  port (val : in integer; status : out integer);
end entity assert_stmt_sem1_ent;

architecture sem of assert_stmt_sem1_ent is
begin
  process(val) is
  begin
    assert val;  -- ERROR: val is integer, not BOOLEAN
    status <= val;
  end process;
end architecture sem;
