-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_016
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Severity must be SEVERITY_LEVEL — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: severity uses a time type value instead of SEVERITY_LEVEL - another variant violating SEM_SEQ_016
-- Expected Result: Triggers semantic error: severity must be SEVERITY_LEVEL, not TIME
-- Dependencies: None
-- =============================================================
entity assert_stmt_smn3_ent is
  port (flag : in boolean; timeout : out boolean);
end entity assert_stmt_smn3_ent;

architecture smn of assert_stmt_smn3_ent is
begin
  process(flag) is
  begin
    assert flag report "timeout" severity 5 ns;  -- ERROR: 5 ns is TIME, not SEVERITY_LEVEL
    timeout <= flag;
  end process;
end architecture smn;
