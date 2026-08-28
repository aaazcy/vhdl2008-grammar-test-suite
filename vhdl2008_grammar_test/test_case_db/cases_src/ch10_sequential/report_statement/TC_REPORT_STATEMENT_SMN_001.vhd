-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_REPORT_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Report expression must be STRING — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: report uses character instead of STRING — character cannot be implicitly converted to STRING
-- Expected Result: Triggers semantic error: report must be STRING, not CHARACTER
-- Dependencies: None
-- =============================================================
entity report_char_expr_ent is
  port (en : in boolean; done : out boolean);
end entity report_char_expr_ent;

architecture smn of report_char_expr_ent is
begin
  process(en) is
  begin
    report 'E' severity note;  -- ERROR: 'E' is CHARACTER, not STRING
    done <= en;
  end process;
end architecture smn;
