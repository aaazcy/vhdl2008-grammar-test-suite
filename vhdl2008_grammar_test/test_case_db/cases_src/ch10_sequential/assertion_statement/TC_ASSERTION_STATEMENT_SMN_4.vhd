-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SMN_4
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_016
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Severity expression in assertion must be of type SEVERITY_LEVEL
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: severity uses integer 0 instead of a SEVERITY_LEVEL enumeration literal - violates SEM_SEQ_016
-- Expected Result: Triggers semantic error: severity must be SEVERITY_LEVEL
-- Dependencies: None
-- =============================================================
entity assert_stmt_sem3_ent is
  port (active : in boolean; err : out integer);
end entity assert_stmt_sem3_ent;

architecture sem of assert_stmt_sem3_ent is
begin
  process(active) is
  begin
    assert active report "inactive" severity 0;  -- ERROR: 0 is integer, not SEVERITY_LEVEL
    err <= 0;
  end process;
end architecture sem;
