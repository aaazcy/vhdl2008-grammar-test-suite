-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: label + severity with all elements: `log: report "msg" severity warning;` with label and severity — verifying that both optional clauses of report can be used at the same time
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity report_full_ent is
  port (
    limit  : in  integer range 0 to 100;
    actual : in  integer range 0 to 100;
    within : out boolean
  );
end entity report_full_ent;

architecture validator of report_full_ent is
begin
  process(limit, actual) is
  begin
    boundary_check: report "Checking actual=" & integer'image(actual)
      & " against limit=" & integer'image(limit)
      severity warning;
    within <= (actual <= limit);
  end process;
end architecture validator;
