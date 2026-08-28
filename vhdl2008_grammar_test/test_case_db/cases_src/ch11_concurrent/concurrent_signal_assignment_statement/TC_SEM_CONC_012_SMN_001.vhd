-- =============================================================
-- Case ID: TC_SEM_CONC_012_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONC_012
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Rule Description: Target of a concurrent signal assignment must be a signal
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: signal assignment to constant
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity sem_conc_012_smn1 is port(r:out integer); end entity;
architecture bh of sem_conc_012_smn1 is
  constant C_VAL:bit:='0';
begin
  -- ERROR: cannot assign to constant
  C_VAL <= '1';
  r <= 0;
end architecture bh;