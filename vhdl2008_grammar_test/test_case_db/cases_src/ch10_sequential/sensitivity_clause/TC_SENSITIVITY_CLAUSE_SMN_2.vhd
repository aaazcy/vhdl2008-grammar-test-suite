-- =============================================================
-- Case ID: TC_SENSITIVITY_CLAUSE_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SENS_CLAUSE_TYPE
-- Standard Reference: IEEE 1076-2008 Section 10.2
-- Rule Description: Sensitivity clause items must be signals
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: variable used in sensitivity list instead of signal
-- Expected Result: Triggers semantic error: sensitivity list item must be signal
-- Dependencies: None
-- =============================================================
entity sens_clause_sem1_ent is port(a:in bit; y:out integer); end entity;
architecture bh of sens_clause_sem1_ent is
begin
  process is
    variable v:bit;
  begin
    v := a;
    wait on v;
    y<=0;
  end process;
end architecture bh;
