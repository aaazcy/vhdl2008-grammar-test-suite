-- =============================================================
-- Case ID: TC_SEM_DRV_001_SMN_005
-- Rule Type: Semantic
-- Related Rule ID: SEM_DRV_001
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Rule Description: A resolved signal may have multiple drivers only if the resolution function is defined for the type
-- Case Type: Negative
-- Error Category: assignment_driver_violation
-- Test Focus: signal assignment to constant
-- Expected Result: Triggers semantic error: assignment_driver_violation
-- Dependencies: None
-- =============================================================
entity sem_drv_001_smn1 is port(r:out integer); end entity;
architecture bh of sem_drv_001_smn1 is
  constant C_VAL:bit:='0';
begin
  -- ERROR: cannot assign to constant
  C_VAL <= '1';
  r <= 0;
end architecture bh;