-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: with severity: `report "msg" severity note;` — verifying that report may carry a severity clause to specify the message level
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity report_severity_ent is
  port (addr : in integer range 0 to 1023; mapped : out integer);
end entity report_severity_ent;

architecture debug of report_severity_ent is
begin
  process(addr) is
  begin
    report "Address mapping: " & integer'image(addr) severity note;
    mapped <= addr * 2;
  end process;
end architecture debug;
