-- =============================================================
-- Case ID: TC_ASSERTION_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_015
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Report expression must be STRING — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: report uses a character literal instead of STRING - another variant violating SEM_SEQ_015
-- Expected Result: Triggers semantic error: report must be STRING, not CHARACTER
-- Dependencies: None
-- =============================================================
entity assert_stmt_smn2_ent is
  port (valid : in boolean; out_val : out integer);
end entity assert_stmt_smn2_ent;

architecture smn of assert_stmt_smn2_ent is
begin
  process(valid) is
  begin
    assert valid report 'X' severity note;  -- ERROR: 'X' is CHARACTER, not STRING
    out_val <= 42;
  end process;
end architecture smn;
