-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_REPORT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Production: report_statement ::= [ label : ] report expression [ severity expression ] ;
-- Case Type: Positive
-- Test Focus: minimal form: only `report "msg";` keyword + string + semicolon, no label, no severity — verifying the minimal syntactic form of the report statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity report_minimal_ent is
  port (flag : in boolean; done : out boolean);
end entity report_minimal_ent;

architecture rtl of report_minimal_ent is
begin
  process(flag) is
  begin
    report "Processing started";
    done <= flag;
  end process;
end architecture rtl;
