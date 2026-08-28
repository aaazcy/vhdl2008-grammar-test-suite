-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: misspelling — `report` is misspelled as `repor`, verifying that the report keyword must be spelled completely and correctly
-- Expected Result: Triggers syntax error: unknown identifier 'repor'
-- Dependencies: None
-- =============================================================
entity report_bad_kw_ent is
  port (val : in boolean; pass : out boolean);
end entity report_bad_kw_ent;

architecture err of report_bad_kw_ent is
begin
  process(val) is
  begin
    repor "test";  -- ERROR: 'repor' is not 'report' keyword
    pass <= val;
  end process;
end architecture err;
