-- =============================================================
-- Case ID: TC_SEM_SEQ_001_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_001
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Rule Description: Target of a signal assignment must be a signal (not a variable, constant, or port of mode IN)
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: signal assignment to constant
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity sem_seq_001_smn1 is port(r:out integer); end entity;
architecture bh of sem_seq_001_smn1 is
  constant C_VAL:bit:='0';
begin
  -- ERROR: cannot assign to constant
  C_VAL <= '1';
  r <= 0;
end architecture bh;