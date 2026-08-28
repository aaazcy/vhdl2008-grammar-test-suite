-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: no report after label colon — the label is written as `lbl: "msg";` missing the report keyword, verifying that the report keyword must follow the label
-- Expected Result: Triggers syntax error: expected 'report' keyword after label
-- Dependencies: None
-- =============================================================
entity report_label_only_ent is
  port (a : in bit; b : out bit);
end entity report_label_only_ent;

architecture err of report_label_only_ent is
begin
  process(a) is
  begin
    info: "data received";  -- ERROR: label with no 'report' keyword
    b <= a;
  end process;
end architecture err;
