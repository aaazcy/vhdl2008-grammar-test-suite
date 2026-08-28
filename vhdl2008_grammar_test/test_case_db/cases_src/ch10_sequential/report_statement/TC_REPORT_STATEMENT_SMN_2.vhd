-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_REPORT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Report expression must be of type STRING
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: report expression uses integer instead of STRING — the expression after report must be of type STRING
-- Expected Result: Triggers semantic error: report expression must be STRING
-- Dependencies: None
-- =============================================================
entity report_int_expr_ent is
  port (val : in integer; out_val : out integer);
end entity report_int_expr_ent;

architecture sem of report_int_expr_ent is
begin
  process(val) is
  begin
    report val severity note;  -- ERROR: val is integer, not STRING
    out_val <= val;
  end process;
end architecture sem;
