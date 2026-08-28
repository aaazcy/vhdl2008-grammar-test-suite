-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SMN_3
-- Rule Type: Semantic
-- Related Rule ID: SEM_REPORT_SEVERITY
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Severity expression in report must be of type SEVERITY_LEVEL
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: severity uses boolean instead of SEVERITY_LEVEL — severity must be of the SEVERITY_LEVEL enumeration type
-- Expected Result: Triggers semantic error: severity must be SEVERITY_LEVEL
-- Dependencies: None
-- =============================================================
entity report_sev_type_ent is
  port (flag : in boolean; status : out boolean);
end entity report_sev_type_ent;

architecture sem of report_sev_type_ent is
begin
  process(flag) is
  begin
    report "check" severity flag;  -- ERROR: flag is BOOLEAN, not SEVERITY_LEVEL
    status <= flag;
  end process;
end architecture sem;
