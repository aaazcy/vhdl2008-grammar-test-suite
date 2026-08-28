-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_PROC_SENS_VAR
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Rule Description: Sensitivity list items must be signals, not variables
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: variable used in process sensitivity list
-- Expected Result: Triggers semantic error: sensitivity list item must be signal
-- Dependencies: None
-- =============================================================
entity proc_sens_smn1_ent is port(a:in bit; y:out integer); end entity;
architecture bh of proc_sens_smn1_ent is
begin
  process is
    variable v:bit;
  begin
    v:=a;
    wait on v;
    y<=0;
  end process;
end architecture bh;
