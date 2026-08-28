-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: expression missing after severity — `report "msg" severity ;` the severity_level expression is missing after the severity keyword
-- Expected Result: Triggers syntax error: expression missing after 'severity' keyword
-- Dependencies: None
-- =============================================================
entity report_nosev_ent is
  port (flag : in boolean; result : out boolean);
end entity report_nosev_ent;

architecture err of report_nosev_ent is
begin
  process(flag) is
  begin
    report "error" severity;  -- ERROR: missing severity expression
    result <= flag;
  end process;
end architecture err;
