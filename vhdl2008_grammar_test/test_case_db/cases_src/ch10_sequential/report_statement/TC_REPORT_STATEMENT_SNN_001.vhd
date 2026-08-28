-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing semicolon — `report "msg"` is followed directly by a newline with no semicolon, verifying that a report_statement must be terminated by a semicolon at the end
-- Expected Result: Triggers syntax error: missing ';' after report statement
-- Dependencies: None
-- =============================================================
entity report_nosemi_ent is
  port (flag : in boolean; out_sig : out boolean);
end entity report_nosemi_ent;

architecture err of report_nosemi_ent is
begin
  process(flag) is
  begin
    report "checking"  -- ERROR: missing semicolon
    out_sig <= flag;
  end process;
end architecture err;
