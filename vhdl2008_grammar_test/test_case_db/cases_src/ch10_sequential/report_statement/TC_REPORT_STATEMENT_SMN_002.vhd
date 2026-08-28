-- =============================================================
-- Case ID: TC_REPORT_STATEMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SMN_REPORT_SEVERITY
-- Standard Reference: IEEE 1076-2008 Section 10.3
-- Rule Description: Severity must be SEVERITY_LEVEL — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: severity uses TIME type "5 ns" instead of SEVERITY_LEVEL
-- Expected Result: Triggers semantic error: severity must be SEVERITY_LEVEL, not TIME
-- Dependencies: None
-- =============================================================
entity report_time_sev_ent is
  port (clk : in bit; active : out bit);
end entity report_time_sev_ent;

architecture smn of report_time_sev_ent is
begin
  process(clk) is
  begin
    report "clocked" severity 10 ns;  -- ERROR: 10 ns is TIME, not SEVERITY_LEVEL
    active <= clk;
  end process;
end architecture smn;
