-- =============================================================
-- Case ID: TC_ASSERTION_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: SEM_ASSERTION_REPORT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Report expression in assertion must be of type STRING
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: report expression returns integer instead of STRING - the report clause of assert requires STRING type
-- Expected Result: Triggers semantic error: report expression must be STRING
-- Dependencies: None
-- =============================================================
entity assert_report_type_ent is
  port (a : in integer; b : out integer);
end entity assert_report_type_ent;

architecture sem of assert_report_type_ent is
begin
  process(a) is
  begin
    assert a > 0 report a severity note;  -- ERROR: report is integer, not STRING
    b <= a;
  end process;
end architecture sem;
