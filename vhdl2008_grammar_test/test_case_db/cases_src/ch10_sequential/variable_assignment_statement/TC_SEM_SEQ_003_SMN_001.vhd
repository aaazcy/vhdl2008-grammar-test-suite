-- =============================================================
-- Case ID: TC_SEM_SEQ_003_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_003
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Rule Description: Target of a variable assignment must be a variable (not a signal or constant)
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: signal assignment to constant
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity sem_seq_003_smn1 is port(r:out integer); end entity;
architecture bh of sem_seq_003_smn1 is
  constant C_VAL:bit:='0';
begin
  -- ERROR: cannot assign to constant
  C_VAL <= '1';
  r <= 0;
end architecture bh;