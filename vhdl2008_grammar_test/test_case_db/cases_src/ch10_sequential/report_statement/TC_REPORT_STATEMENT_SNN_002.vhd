-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing expression — `report ;` keyword followed directly by a semicolon, missing the required STRING expression
-- Expected Result: Triggers syntax error: expression missing after 'report' keyword
-- Dependencies: None
-- =============================================================
entity report_noexpr_ent is
  port (en : in bit; done : out bit);
end entity report_noexpr_ent;

architecture err of report_noexpr_ent is
begin
  process(en) is
  begin
    report;  -- ERROR: missing expression after 'report'
    done <= en;
  end process;
end architecture err;
